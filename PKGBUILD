# Maintainer: Denis Kasak <dkasak AT termina DOT org DOT uk>

pkgname=graphtage
pkgver=0.2.1
pkgrel=1
pkgdesc="Graphtage is a commandline utility and underlying library for semantically comparing and merging tree-like structures, such as JSON, XML, HTML, YAML, and CSS files."
arch=('any')
url=https://github.com/trailofbits/graphtage
license=('LGPLv3')
depends=('python' 'python-colorama' 'python-intervaltree' 'python-json5>=0.9.5' 'python-yaml' 'python-scipy>=1.4.0' 'python-tqdm' 'python-typing_extensions>=3.6.5')
makedepends=('python-setuptools')
source=(https://github.com/trailofbits/graphtage/archive/v${pkgver}.tar.gz)
sha256sums=('5cf0c8908e5e5d526dd9a2769acbd0554579132e69da8ee486b6336a491585dd')

build() {
    cd "$srcdir/$pkgname-$pkgver/"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver/"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:ts=4:sw=4:et:
