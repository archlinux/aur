# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=python-readme-renderer
pkgver=0.7.0
pkgrel=1
pkgdesc='Python library to safely render arbitrary README files into HTML'
arch=('any')
url='https://github.com/pypa/readme_renderer'
license=('Apache')
depends=('python-bleach' 'python-docutils' 'python-pygments')
makedepends=('python-setuptools')
conflicts=('python-readme')
provides=('python-readme')
source=("https://pypi.python.org/packages/3f/f4/da9757e48bc62fb01110a6c9ab598a586f3f15142288ecf42173bae068f1/readme_renderer-${pkgver}.tar.gz")
sha256sums=('5399825a1ebef9311f365eed7050f8049e3489156e8761f26b3a55e4dc7b09ce')


build() {
    cd "$srcdir/readme_renderer-$pkgver"

    python setup.py build
}

package() {
    cd "$srcdir/readme_renderer-$pkgver"

    python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
