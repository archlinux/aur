# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-charset-normalizer
pkgver=1.3.4
pkgrel=1
pkgdesc='Like Chardet. Package for encoding & language detection. Charset detection'
arch=('any')
url="https://github.com/Ousret/charset_normalizer"
license=('MIT')
provides=('python-charset_normalizer')
depends=('python'
         'python-cached-property'
         'python-prettytable'
         'python-loguru'
         'python-dragonmapper'
         'python-zhon')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Ousret/charset_normalizer/archive/${pkgver}.tar.gz")
sha256sums=('e4c6f8bc03a2cc901de40f922c0fb7c36ef9238e06209febfffb1d54acf59d2c')

package() {
  cd "charset_normalizer-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}