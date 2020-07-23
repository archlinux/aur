# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-metadata-parser
pkgver=0.10.3
pkgrel=1
pkgdesc='A module to parse metadata out of urls and html documents'
arch=('any')
url='https://github.com/jvanasco/metadata_parser'
license=('MIT')
depends=('python-beautifulsoup4'
         'python-requests'
         'python-requests-toolbelt'
         'python-six')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jvanasco/metadata_parser/archive/v${pkgver}.tar.gz")
sha256sums=('c37e52a54c5b7c789fae581e74fc6cd6292c8d2acfe822fe40006e443fe4e24b')

package() {
  cd "metadata_parser-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}