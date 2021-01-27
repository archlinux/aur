# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname="python-rtmidi"
pkgdesc="Python bindings for the cross-platform MIDI I/O library RtMidi"
pkgver=1.4.7
pkgrel=1
arch=('i686' 'x86_64' 'arm')
url="https://github.com/SpotlightKid/python-rtmidi"
license=('MIT')
depends=('jack' 'python')
makedepends=('cython' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d7dbc2b174b09015dfbee449a672a072aa72b367be40b13e04ee35a2e2e399e3')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --skip-build --optimize=1

  # license
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
