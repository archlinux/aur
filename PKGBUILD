# Maintainer: Jingbei Li <i@jingbei.li>
# Contributer: Jose Riha <jose1711 gmail com>

pkgname=python-torchaudio
_pkgname=audio
pkgver=0.6.0
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
sha512sums=('4dfe7f2b3112f851143c6a0114240b61c5feab3258d06b222ab5df21baf9644b0219f09946a5d09ea385f739dfd9aaddd970648f8cf555fb1d9d468aa10e2cf8')

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

