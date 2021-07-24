# Maintainer: Bakasura <bakasura@protonmail.ch>

pkgname=abgx360
pkgver=1.0.6
pkgrel=3
pkgdesc="An app for checking Xbox 360 ISOs"
url="https://bakasurarce.github.io/abgx360/"
arch=('x86_64' 'i686')
license=('unknown')
depends=('zlib' 'curl')
optdepends=('abgx360gui: a GUI for this tool')
source=("https://github.com/BakasuraRCE/abgx360/releases/download/v1.0.6-and-v1.0.2/linux_abgx360-1.0.6.tar.gz")
md5sums=('04b0c9e0461faa92ca5f8fac78bafe57')
install=abgx360.install

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # abgx360.net is somehow no longer working, so we'll switch to abgx360.xecuter.com for now
  sed -i 's/abgx360.net\/Apps/hadzz.com\/abgx/g' src/abgx360.c
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  #./autogen.sh
  ./configure
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
