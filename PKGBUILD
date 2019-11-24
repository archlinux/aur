# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname="python-rtmidi"
pkgdesc="Python bindings for the cross-platform MIDI I/O library RtMidi"
pkgver=1.3.1
pkgrel=1
arch=('i686' 'x86_64' 'arm')
url="https://github.com/SpotlightKid/python-rtmidi"
license=('MIT')
depends=('jack' 'python')
makedepends=('cython' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f9d2a1b5374b2e6856006537b6d4d5ceed4db4c4ee60caec4af83707a78297e4')


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
