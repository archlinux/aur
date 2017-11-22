# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname='pid-tools'
pkgdesc="Some commandline tools for dealing with pids, information about processes, and their relations"
pkgver=3.1.0
pkgrel=2
arch=('any')
license=('GPLv2')
url="http://github.com/kata198/pid-tools"
makedepends=('gcc' 'make')
source=("https://github.com/kata198/pid-tools/archive/${pkgver}.tar.gz")
sha512sums=("091dbc507f0f3678e72610f3e2c943435002ccb415b703cf24335cfeb54bd958739e6cf61cb24ddf0cd0da9257af4d3908d07045bf0644d834542095db7321af")

build() {
  cd "$srcdir/${pkgname}-$pkgver"

  make
}

package() {
  cd "${pkgname}-$pkgver"

  # Bug in MAKEFILE, have to end DESTDIR with /usr
  make install DESTDIR="${pkgdir}/usr"
}

