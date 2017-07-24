# Maintainer: Mikołaj Baranowski <mikolajb@gmail.com>

pkgname=csvfilter
pkgver=0.1
pkgrel=2
pkgdesc='Filter for csv files.'
license=('MIT')
arch=('x86_64' 'i686')
url='https://github.com/mikolajb/csvfilter'
depends=()
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mikolajb/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('faa0f02017b64c8e003a4f356637940033c20f4b26adae802e33f27a078551f1')

build() {
  msg2 'Compiling...'

  cd ${srcdir}/${pkgname}-${pkgver}/
  GOPATH="$GOPATH:$srcdir" go build -o csvfilter
}

package() {
  msg2 'Installing...'

  install -Dm755 ${srcdir}/${pkgname}-${pkgver}/csvfilter ${pkgdir}/usr/bin/csvfilter
}
