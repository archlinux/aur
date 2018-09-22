# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=rextract
pkgver=1.0.0
pkgrel=2
pkgdesc="Powerful commandline tool to extract and manipulate strings using regular exressions"
arch=('any')
license=('GPLv3')
url="http://github.com/kata198/rextract"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python')
source=("https://github.com/kata198/rextract/archive/${pkgver}.tar.gz")
sha512sums=('70ed19664cb83a845045480e50e4097ffd4b0aabdab2382064360a0f198d6ec8a14e77a1c9979cd9f94983ab9acfda48078cea17b60c92c14eea89967e26027d')

build() {
  cd "$srcdir"/rextract-$pkgver
  python setup.py build
}

package() {
  cd rextract-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
