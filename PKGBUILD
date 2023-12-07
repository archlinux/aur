# Maintainer: Eragon <eragon at eragon dot re>
# Contributor: Nigel Kukard <nkukard@lbsd.net>
# Contributor: Serge Victor <arch@random.re>

_pipname=Flask-DebugToolbar
pkgname=python-flask-debugtoolbar
pkgver=0.14.0
pkgrel=0
pkgdesc="A toolbar overlay for debugging Flask applications"
arch=('any')
url="https://flask-debugtoolbar.readthedocs.io/"
license=('BSD')
makedepends=('python-setuptools')
depends=('python-blinker' 'python-flask' 'python-werkzeug' 'python-itsdangerous')
source=("https://pypi.python.org/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz")
sha256sums=('bd0435e902a02b2efc1e8cdddca0f4e4c1b746d68c8b860e449984e962766a18')

package() {
    cd "$_pipname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1

    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

