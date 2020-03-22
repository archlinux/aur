# Maintainer: Your Name <drmargarido@gmail.com>
pkgname=d-tracker
pkgver=1.2.r0.g14723c9
pkgrel=1
pkgdesc="Lightweight, cross-platform and simple to setup timetracker. Similar to hamster but uses about 10MB of RAM and has a small quantity of dependencies."
arch=("i686" "x86_64")
url="https://github.com/drmargarido/d-tracker"
license=('MIT')
depends=()
makedepends=("gcc" "automake" "libtool" "git" "libx11" "libxft" "libxext" "libxxf86vm")
source=("git+https://github.com/drmargarido/d-tracker.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
	cd "${srcdir}/${pkgname}"
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	make install INSTALLDIR="${pkgdir}/usr"
}
