# Maintainer: Pranshu Tanwar "PranshuTG" <12345qwertyman12345@gmail.com>
pkgname=libnymphcast-git
_reponame=libnymphcast
pkgver=116
pkgrel=1
pkgdesc="Libnymphcast is a library containing the core functionality for a NymphCast client"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/MayaPosch/libnymphcast.git"
license=('BSD-3-Clause')
groups=()
depends=('nymphrpc' 'poco')
makedepends=('git')
provides=('libnymphcast')
source=("git+https://github.com/MayaPosch/libnymphcast.git")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_reponame}
  git rev-list --count HEAD
}

build() {
	cd ${srcdir}/libnymphcast
	make lib
}

package() {
	cd ${srcdir}/libnymphcast
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	make DESTDIR="$pkgdir" install
}
