# Maintainer: hexchain <i at hexchain dot org>

# align with other python packages - nototools is not in PyPI!
_pypiname=nototools
pkgname=python-nototools
pkgdesc="Noto fonts support tools and scripts plus web site generation"
url="https://github.com/googlefonts/nototools"
license=('Apache')
arch=('any')
pkgver=0.2.1
pkgrel=1
depends=('python-booleanoperations' 'python-defcon' 'python-fonttools' 'python-pillow' 'python-pyclipper' 'scour')
makedepends=('python-pip')
source=("nototools-$pkgver.tar.gz::https://github.com/googlefonts/nototools/archive/v0.2.1.tar.gz")
sha256sums=('cfbd280b395445350f3d2b5c4de0f1b69fd03f7b1751fbb3a2d9f90406532fe9')

build() {
    cd "$srcdir/$_pypiname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pypiname-$pkgver"
    python setup.py install --optimize=1 --root="$pkgdir/" --prefix=/usr --skip-build
}
