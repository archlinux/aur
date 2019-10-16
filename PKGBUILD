# Maintainer: Christopher Arndt <chris at chrisarndt.de>

pkgname='python-mido'
_name='mido'
pkgver='1.2.9'
pkgrel=2
pkgdesc="A Python library for working with MIDI messages and ports"
url="https://mido.readthedocs.io/"
depends=('python-rtmidi')
makedepends=('python-setuptools')
optdepends=(
  'portmidi: for PortMidi support'
  'python-pygame: for PortMidi support'
)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('bec86e55a19f5bfdd5a3546c7cdc418a')


build() {
  cd "${srcdir}/${_name}-${pkgver}"

  python setup.py build
}

package() {

  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  # license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
