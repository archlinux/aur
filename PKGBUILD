# Maintainer: Mikołaj Baranowski <mikolajb@gmail.com>

pkgname=servedir
pkgver=0.2
pkgrel=2
pkgdesc='Simple tool for sharing and uploading files through HTTP protocol.'
license=('MIT')
arch=('x86_64' 'i686')
url='https://github.com/mikolajb/servedir'
depends=()
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mikolajb/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('200b87f62706807d12cbcb5ecadc2caf73299aeb47804a9dd19b7d2bee5b4747')

build() {
  msg2 'Compiling...'

  cd ${srcdir}/${pkgname}-${pkgver}/
  GOPATH="${srcdir}" go build -o servedir
}

package() {
  msg2 'Installing...'

  install -Dm755 ${srcdir}/${pkgname}-${pkgver}/servedir ${pkgdir}/usr/bin/servedir
}
