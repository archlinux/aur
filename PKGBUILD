# Maintainer: Christopher Arndt <chris@chrisarndt.de>

pkgname=python-readme
pkgver=0.5.1
pkgrel=1
pkgdesc='Python library to safely render arbitrary README files into HTML'
arch=('any')
url='https://github.com/pypa/readme'
license=('Apache')
depends=('python-bleach' 'python-docutils' 'python-html5lib' 'python-pygments')
makedepends=('python-setuptools')
source=("http://pypi.python.org/packages/source/r/readme/readme-${pkgver}.tar.gz")
sha256sums=('4d33851d7fa56d1f93b7ba979ebbb17b5175ccde9fd9dfb974427bdd72ec667b')


build() {
    cd "$srcdir/readme-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/readme-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
