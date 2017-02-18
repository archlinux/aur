# Maintainer: ngld <ngld@tproxy.de>
_name=knossos
pkgname=fs2-knossos
pkgver=0.4.2
pkgrel=1
pkgdesc="A simple mod manager for FreeSpace 2 Open"
arch=('any')
url="https://github.com/ngld/knossos"
license=('Apache')
groups=()
depends=('python' 'python-six' 'python-requests' 'python-pyqt5' 'qt5-webengine' 'qt5-webchannel' 'python-semantic-version' 'python-raven' 'p7zip' 'openal' 'sdl2')
makedepends=('python-setuptools')
options=(!emptydirs)
source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
    knossos
    knossos.desktop)
md5sums=('6705504d0114c7cf4a25412bbdd4485b'
         '541dfc75f3aecbe08b843eeec252e4b4'
         'afd34e2bf9b8f74c1fc5785662e1f04a')

package() {
    cd "$srcdir/${_name}-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1

    install -Dm755 ../knossos "$pkgdir/usr/bin/knossos"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
    install -Dm644 ../knossos.desktop "$pkgdir/usr/share/applications/knossos.desktop"
}

# vim:set ts=2 sw=2 et:
