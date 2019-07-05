# Maintainer: Daniel Appelt <daniel.appelt@gmail.com>
_pkgbasename=rtmidi
pkgname=python-py${_pkgbasename}
pkgver=2.3.4
pkgrel=2
pkgdesc="Realtime MIDI I/O for python"
arch=('i686' 'x86_64')
url="https://github.com/patrickkidd/pyrtmidi"
license=('unknown')
depends=('python' 'jack')
makedepends=('python-setuptools')
conflicts=('python-rtmidi')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_pkgbasename::1}/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.gz")
sha256sums=('f1ffd73d6571e6ce2769d77e247523738605a71c32d8f60b56a3b41002d0d54c')

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --jack-midi
}
