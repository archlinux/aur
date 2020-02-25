# Maintainer: Ashley Ruglys <ashley.ruglys@gmail.com>
pkgname=pumba-git
_pkgname=pumba
pkgdesc="Chaos testing tool for Docker"
pkgrel=1
pkgver=0.7.1
arch=('i686' 'x86_64')
provides=("pumba")
url="https://github.com/alexei-led/pumba/releases"
license=('APACHE')
depends=()
makedepends=('go')
source=("$_pkgname::git+https://github.com/alexei-led/pumba")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	cat VERSION
}

build() {
	cd $_pkgname
	./hack/build.sh
}

package() {
	cd $_pkgname
	install -D -m755 "$srcdir/$_pkgname/.bin/pumba" "$pkgdir/usr/bin/pumba"
}
