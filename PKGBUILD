# Maintainer: Denis Kasak <dkasak AT termina DOT org DOT uk>

pkgname=graphtage
pkgver=0.2.5
pkgrel=1
pkgdesc="A utility for semantically comparing and merging tree-like structures, such as JSON, XML, HTML, YAML, and CSS files."
arch=('any')
url=https://github.com/trailofbits/graphtage
license=('LGPLv3')
depends=('python' 'python-colorama' 'python-intervaltree' 'python-json5>=0.9.5' 'python-yaml' 'python-scipy>=1.4.0' 'python-tqdm' 'python-typing_extensions>=3.6.5')
makedepends=('python-setuptools')
source=(https://github.com/trailofbits/graphtage/archive/v${pkgver}.tar.gz)
sha256sums=('5904aac2c487cb8eb2a742cc7eb16154ae27a0a4a0da52edc3a8feb2cd580319')

build() {
    cd "$srcdir/$pkgname-$pkgver/"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver/"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:ts=4:sw=4:et:
