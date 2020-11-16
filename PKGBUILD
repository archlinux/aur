# Maintainer: Jingbei Li <i@jingbei.li>
# Contributer: Jose Riha <jose1711 gmail com>

pkgname=python-torchaudio
_pkgname=audio
pkgver=0.7.0
pkgrel=1
pkgdesc="Data manipulation and transformation for audio signal processing, powered by PyTorch"
arch=('any')
url="https://github.com/pytorch/audio"
license=('BSD')
depends=('python' 'sox' 'python-pytorch')
optdepends=('python-kaldi-io')
makedepends=('git' 'python-setuptools')
conflicts=('python-torchaudio-git')
source=("$url/archive/v${pkgver}.tar.gz")
sha512sums=('160ed573bfc6dfed80b24c3a13bb163f192f9fd413a7189b039d5b94a15eb9d8f2e6c716f8668af8aaca0af3896379994ae93d60f6cf09f959dcc305912491bd')

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

