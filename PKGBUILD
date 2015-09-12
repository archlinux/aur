# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=python-readme
pkgver=0.6.0
pkgrel=1
pkgdesc='Python library to safely render arbitrary README files into HTML'
arch=('any')
url='https://github.com/pypa/readme'
license=('Apache')
depends=('python-bleach' 'python-docutils' 'python-html5lib' 'python-pygments')
makedepends=('python-setuptools')
source=("http://pypi.python.org/packages/source/r/readme/readme-${pkgver}.tar.gz")
sha256sums=('150c55626d2be4237616d84367b789e398f4d416029e5c62b09fd1688fe14222')


build() {
    cd "$srcdir/readme-$pkgver"

    python setup.py build
}

package() {
    cd "$srcdir/readme-$pkgver"

    python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
