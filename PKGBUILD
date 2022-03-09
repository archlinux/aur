# Maintainer: Kim Scarborough <kim@scarborough.kim>

pkgname=python-anyascii
pkgver=0.3.0
pkgrel=1
pkgdesc="Transliterates almost all Unicode characters to ASCII"
arch=(any)
url='https://github.com/anyascii/anyascii'
license=('ISC')
depends=('python')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/anyascii/anyascii/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8afb5388b694e67bedafe9798b1b8ba0d4f3a7141f4a9980f75ca3f489843fc1')

package() {
  cd "${srcdir}/anyascii-${pkgver}/impl/python"
  python setup.py install --root="$pkgdir"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
