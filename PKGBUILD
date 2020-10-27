# Maintainer: Denis Kasak <dkasak AT termina DOT org DOT uk>

pkgname=graphtage
pkgver=0.2.2
pkgrel=2
pkgdesc="Graphtage is a commandline utility and underlying library for semantically comparing and merging tree-like structures, such as JSON, XML, HTML, YAML, and CSS files."
arch=('any')
url=https://github.com/trailofbits/graphtage
license=('LGPLv3')
depends=('python' 'python-colorama' 'python-intervaltree' 'python-json5>=0.9.5' 'python-yaml' 'python-scipy>=1.4.0' 'python-tqdm' 'python-typing_extensions>=3.6.5')
makedepends=('python-setuptools')
source=(https://github.com/trailofbits/graphtage/archive/v${pkgver}.tar.gz)
sha256sums=('f1d2b8b860c71e6e42e08079922cb1ca68911d3ebdab8d996e3fbd674ecddb7b')

build() {
    cd "$srcdir/$pkgname-$pkgver/"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver/"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:ts=4:sw=4:et:
