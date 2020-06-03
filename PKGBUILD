# Maintainer: hexchain <i at hexchain dot org>

# align with other python packages - nototools is not in PyPI!
_pypiname=notofonttools
pkgname=python-nototools
pkgdesc="Noto fonts support tools and scripts plus web site generation"
url="https://github.com/googlefonts/nototools"
license=('Apache')
arch=('any')
pkgver=0.2.11
pkgrel=1
depends=('python-booleanoperations' 'python-defcon' 'python-fonttools' 'python-pillow' 'python-pyclipper' 'scour')
makedepends=('python-pip')
source=("https://pypi.org/packages/source/${_pypiname:0:1}/$_pypiname/$_pypiname-$pkgver.tar.gz")
sha256sums=('d6cf474d6a2859353901a1600165ed59e188667d4178e746bf37107b138955ac')

build() {
    cd "$srcdir/$_pypiname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pypiname-$pkgver"
    python setup.py install --optimize=1 --root="$pkgdir/" --prefix=/usr --skip-build
}
