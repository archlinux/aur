# Maintainer: Denis Kasak <dkasak AT termina DOT org DOT uk>

pkgname=polyfile
pkgver=0.1.7
pkgrel=1
pkgdesc="A utility to identify and map the semantic structure of files, including polyglots, chimeras, and schizophrenic files."
arch=('any')
url=https://github.com/trailofbits/polyfile
license=('LGPLv3')
depends=('python' 'python-graphviz' 'python-intervaltree' 'python-jinja'
         'python-kaitaistruct>=0.7' 'python-networkx' 'python-pillow>=5.0.0'
         'python-yaml>=3.13')
makedepends=('python-setuptools')
source=(https://github.com/trailofbits/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('201e329a0762165c54e95758c1c9e26a70a68d821d464b5801568c2a0c3c14d8')

build() {
    cd "$srcdir/$pkgname-$pkgver/"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver/"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:ts=4:sw=4:et:
