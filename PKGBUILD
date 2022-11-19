# Maintainer : Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=python38-chardet
pkgver=5.0.0
pkgrel=1
arch=('any')
url="https://github.com/chardet/chardet"
license=('LGPL')
depends=('python38')
pkgdesc="Python3 module for character encoding auto-detection"
makedepends=('python38-setuptools')
checkdepends=('python38-pytest')
source=("https://pypi.io/packages/source/c/chardet/chardet-${pkgver}.tar.gz")
sha512sums=('3853248584d53d977abe0e6ab856e1526fd7360d9b94b4f08d03895da80ba9efac8882dbd3f919f0d52b0699c0d7fd68edb223c37512685976c6f2b212fbe0ff')

build() {
   cd "$srcdir"/chardet-$pkgver
   python3.8 setup.py build
}

check() {
   cd "$srcdir"/chardet-$pkgver
   python3.8 -m pytest
}

package() {
   cd chardet-$pkgver
   python3.8 setup.py install --root="$pkgdir" --optimize=1
}
