# Maintainer: ngld <ngld@tproxy.de>
_pyname=knossos
pkgname=fs2-knossos
pkgver=0.1.1
pkgrel=1
pkgdesc="A simple mod manager for FreeSpace 2 Open"
arch=('any')
url="https://github.com/ngld/knossos"
license=('Apache')
groups=()
depends=('python' 'python-six' 'python-requests' 'python-pyside' 'p7zip' 'openal' 'sdl2')
makedepends=('python-setuptools')
options=(!emptydirs)
install=fs2-knossos.install
source=(
    "https://pypi.python.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-$pkgver.tar.gz"
    knossos.desktop)
md5sums=('f4f39e565fea1606e874a8175bf183b0'
         'e1089d09654420e95187d3adbe785670')

package() {
    cd "$srcdir/${_pyname}-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
    install -Dm644 ../knossos.desktop "$pkgdir/usr/share/applications/knossos.desktop"
}

# vim:set ts=2 sw=2 et:
