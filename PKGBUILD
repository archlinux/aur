# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname="python-rtmidi"
pkgdesc="Python bindings for the cross-platform MIDI I/O library RtMidi"
pkgver=1.4.2
pkgrel=1
arch=('i686' 'x86_64' 'arm')
url="https://github.com/SpotlightKid/python-rtmidi"
license=('MIT')
depends=('jack' 'python')
makedepends=('cython' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('3721ed3643f407cd96ad377cff0c2e28f2e8df0abbbe15a8a9668daae0b2b743')


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
