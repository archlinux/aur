# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-neuralcoref
pkgver=4.0.0
pkgrel=1
pkgdesc='Coreference Resolution in spaCy with Neural Networks'
arch=('any')
url='https://huggingface.co/coref'
license=('MIT')
depends=('python-spacy'
         'cython')
optdepends=('python-pytest')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/huggingface/neuralcoref/archive/v${pkgver}.tar.gz")
sha256sums=('6cf7662e35f03c3b2c8386c0faad8c37bc7c539a5cd81472560986a2d30bb255')

package() {
  cd "neuralcoref-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}