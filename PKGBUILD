# Maintainer: Sashanoraa <sasha@noraa.gay>

pkgname=python-confusables
pkgver=1.2.0
pkgrel=1
pkgdesc="A python package providing functionality for matching words that can be confused for eachother, but contain different characters"
arch=('any')
url="https://pypi.org/project/confusables/"
license=('MIT')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
depends=('python')
makedepends=('python-setuptools')
sha256sums=('429caad05333832e1edabb80815704cd26530514369430f913002b2ba548c38e')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
