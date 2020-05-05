# Maintainer: Christopher Arndt <chris at chrisarndt.de>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>

pkgname='adafruit-ampy'
pkgver=1.0.7
pkgrel=2
pkgdesc="Utility to interact with a CircuitPython or MicroPython board over a serial connection."
url="https://github.com/scientifichackers/ampy"
arch=('any')
license=('MIT')
depends=('python-click' 'python-pyserial' 'python-dotenv' 'python-setuptools')
provides=('python-ampy' 'ampy')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('097f67915636c5491be98572c42782e9e98a14c4e37a6041f199b310790383e48fb61cf3d98b2d2902f01e3bbdc1f345b8c70c17a2a0eb62894c3a05cf1aa67f')

build() {
  cd "${srcdir}/adafruit-ampy-${pkgver}"

  python setup.py build
}

package() {
  cd "${srcdir}/adafruit-ampy-${pkgver}"

  python setup.py install --root="$pkgdir/" --skip-build  --optimize=1
  # install documentation
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  # install license
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
