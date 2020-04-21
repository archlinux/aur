# Maintainer: Kilian Guillaume "cafehaine" <kilian dot guillaume at gmail dot com>
pkgname=nymphrpc-git
_pkgname=nymphrpc
_reponame=NymphRPC
pkgver=58
pkgrel=1
pkgdesc="Versatile and fast remote procedure call library."
arch=('x86_64')
url="https://github.com/MayaPosch/NymphRPC"
license=('BSD-3-Clause')
#TODO check the dependencies
depends=()
makedepends=('git' 'poco')
source=("git+https://github.com/MayaPosch/NymphRPC.git")
md5sums=('SKIP')
provides=('nymphrpc')

pkgver() {
  cd ${srcdir}/${_reponame}
  git rev-list --count HEAD
}

build() {
	cd ${srcdir}/${_reponame}
	make lib
}

package() {
	cd ${srcdir}/${_reponame}
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	make DESTDIR="$pkgdir/" install
}
