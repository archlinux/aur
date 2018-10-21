# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname='pid-tools'
pkgdesc="Some commandline tools for dealing with pids, information about processes, and their relations"
pkgver=5.0.0
pkgrel=1
arch=('any')
license=('GPLv2')
url="http://github.com/kata198/pid-tools"
makedepends=('gcc' 'make')
source=("https://github.com/kata198/pid-tools/archive/${pkgver}.tar.gz")
sha512sums=("8cf9fb45ac4485fb9961f03e330d0493dab506b3e97f4801731771b816d71fb3bd5e8d87caf698ca89edc85034e399fa33139eade06fc3e71d33b726b9b7230e")

build() {
  cd "$srcdir/${pkgname}-$pkgver"

  make
}

package() {
  cd "${pkgname}-$pkgver"

  # Bug in MAKEFILE, have to end DESTDIR with /usr
  make install DESTDIR="${pkgdir}/usr" PREFIX="/"
}

