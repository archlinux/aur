# Maintainer: ngld <ngld@tproxy.de>
_pyname=knossos
pkgname=fs2-knossos
pkgver=0.3.1
pkgrel=2
pkgdesc="A simple mod manager for FreeSpace 2 Open"
arch=('any')
url="https://github.com/ngld/knossos"
license=('Apache')
groups=()
depends=('python' 'python-six' 'python-requests' 'python-pyqt5' 'python-semantic-version' 'python-raven' 'p7zip' 'openal' 'sdl2')
makedepends=('python-setuptools')
options=(!emptydirs)
install=fs2-knossos.install
source=(
    "https://pypi.python.org/packages/17/f7/340904483511e158935d7e75e8cbbaf4812672cd0808336704a88cf09b9b/knossos-0.3.1.tar.gz"
    knossos.desktop)
md5sums=('9e5d843cb40b25e4406842ddefa336db'
         'e1089d09654420e95187d3adbe785670')

package() {
    cd "$srcdir/${_pyname}-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
    install -Dm644 ../knossos.desktop "$pkgdir/usr/share/applications/knossos.desktop"
}

# vim:set ts=2 sw=2 et:
