# Maintainer: Matt Kuzminski <mattkuzminski at gmail dot com>

_pkgname=git-plus
pkgname="python-$_pkgname"
pkgver=0.4.6
pkgrel=1
pkgdesc="Git plus is a set of git utilities"
arch=('any')
url="https://github.com/tkrajina/$_pkgname"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("$_pkgname-$pkgver.tar.gz"::"$url/archive/v$pkgver.tar.gz")
sha256sums=('ef50b2aaaed0403c32c8bd3fdfd91b1a76e3e367d8b48d4564e1f0ad13c31747')

build() {
  cd $srcdir/$_pkgname-$pkgver
  python setup.py build
}

package() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
