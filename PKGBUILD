# Maintainer: Louis Sven Goulet <louis dot sven at gmail dot com>
pkgname="rpolcalc-git"
pkgver=c23e6a9
pkgrel=3
pkgdesc="A powerful reverse notation calculator for your terminal"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/lorlouis/RpolCalc"
license=('GPL')
depends=('gcc-libs')
makedepends=('cmake' 'git' 'gcc-libs')
provides=('rpolcalc')
source=("${pkgname}::git+https://github.com/lorlouis/RpolCalc.git#branch=master")
md5sums=('SKIP')
pkgver() {
  cd "${pkgname}"
  git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${pkgname}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}"
	make DESTDIR="$pkgdir/" install
}
