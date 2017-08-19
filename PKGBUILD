# Maintainer: Daniel Appelt <daniel.appelt@gmail.com>
_pkgbasename=rtmidi
pkgname=python-py${_pkgbasename}
pkgver=2.3.2
pkgrel=1
pkgdesc="Realtime MIDI I/O for python"
arch=('i686' 'x86_64')
url="https://github.com/patrickkidd/pyrtmidi"
license=('unknown')
depends=('python' 'jack')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_pkgbasename::1}/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.gz")
sha256sums=('5a23ad612d998a7201d9a64abbf65a48917e5f00710ad8185e9498dad3f7f151')

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --jack-midi
}
