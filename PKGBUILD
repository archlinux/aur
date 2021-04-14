# Maintainer: hexchain <i at hexchain dot org>

# align with other python packages - nototools is not in PyPI!
_pypiname=notofonttools
pkgname=python-nototools
pkgdesc="Noto fonts support tools and scripts plus web site generation"
url="https://github.com/googlefonts/nototools"
license=('Apache')
arch=('any')
pkgver=0.2.13
pkgrel=1
depends=('python-booleanoperations' 'python-defcon' 'python-fonttools' 'python-pillow' 'python-pyclipper' 'scour')
makedepends=('python-pip')
source=("https://pypi.org/packages/source/${_pypiname:0:1}/$_pypiname/$_pypiname-$pkgver.tar.gz")
sha256sums=('98dec3617329269e0da0aa37caac7b57d1fec33c7f8797d4ec0ad374831a9b05')

build() {
    cd "$srcdir/$_pypiname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pypiname-$pkgver"
    python setup.py install --optimize=1 --root="$pkgdir/" --prefix=/usr --skip-build
}
