# Maintainer: Axel McLaren <scm(at)axml(dot)uk>

pkgname=ucn
pkgver=1.0.0
pkgrel=1
pkgdesc="utility to print unicode symbol names"
arch=('x86_64' 'aarch64')
url="https://github.com/mgumz/ucn"
license=('BSD')
depends=('glibc')
makedepends=('go')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('12ec1d661fcdd60000f4843129b0f2de594951176421124c2ff64416dc41fa7b')

build() {
  cd "${pkgname}-${pkgver}"

  make
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 bin/ucn "${pkgdir}/usr/bin/ucn"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
