# Maintainer: Eragon <eragon at eragon dot re>
# Contributor: Nigel Kukard <nkukard@lbsd.net>
# Contributor: Serge Victor <arch@random.re>

_pipname=Flask-DebugToolbar
pkgname=python-flask-debugtoolbar
pkgver=0.14.1
pkgrel=0
pkgdesc="A toolbar overlay for debugging Flask applications"
arch=('any')
url="https://flask-debugtoolbar.readthedocs.io/"
license=('BSD')
makedepends=('python-setuptools')
# python-packaging will be dropped as a dependency in the next release
depends=('python-blinker' 'python-flask' 'python-werkzeug' 'python-itsdangerous' 'python-packaging')
source=("https://pypi.python.org/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz")
sha256sums=('ccd6a72119ea4f7c486823591b2b2f4a14dc7fb38d6bd495272e0ebdc08724cd')

package() {
    cd "$_pipname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1

    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

