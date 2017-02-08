# Maintainer: ngld <ngld@tproxy.de>
_pyname=knossos
pkgname=fs2-knossos
pkgver=0.3.2
pkgrel=1
pkgdesc="A simple mod manager for FreeSpace 2 Open"
arch=('any')
url="https://github.com/ngld/knossos"
license=('Apache')
groups=()
depends=('python' 'python-six' 'python-requests' 'python-pyqt5' 'python-semantic-version' 'python-raven' 'p7zip' 'openal' 'sdl2')
makedepends=('python-setuptools')
options=(!emptydirs)
source=(
    "https://pypi.python.org/packages/41/45/f89b77fb39ad44a728ae79e479f17a024e24deb567c4138abcb0cb5bb5de/knossos-0.3.2.tar.gz"
    knossos.desktop)
md5sums=('7e3ba3dcceedd98b0b2c54faa99dc74b'
         'afd34e2bf9b8f74c1fc5785662e1f04a')

package() {
    cd "$srcdir/${_pyname}-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
    install -Dm644 ../knossos.desktop "$pkgdir/usr/share/applications/knossos.desktop"
}

# vim:set ts=2 sw=2 et:
