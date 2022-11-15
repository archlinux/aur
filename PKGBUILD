# Maintainer: Eragon <eragon at eragon dot re>
# Contributor: Nigel Kukard <nkukard@lbsd.net>
# Contributor: Serge Victor <arch@random.re>

_pipname=Flask-DebugToolbar
pkgname=python-flask-debugtoolbar
pkgver=0.13.1
pkgrel=1
pkgdesc="A toolbar overlay for debugging Flask applications"
arch=('any')
url="https://flask-debugtoolbar.readthedocs.io/"
license=('BSD')
makedepends=('python-setuptools')
depends=('python-blinker' 'python-flask' 'python-werkzeug' 'python-itsdangerous')
source=("https://pypi.python.org/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz")
sha256sums=('0c26aa013a9813b8886857bf0ec24d28ab494114a264baf06c951cadc4dd0dae')

package() {
    cd "$_pipname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1

    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

