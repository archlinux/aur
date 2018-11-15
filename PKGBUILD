# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=rextract
pkgver=1.1.1
pkgrel=1
pkgdesc="Powerful commandline tool to extract and manipulate strings using regular exressions"
arch=('any')
license=('GPLv3')
url="http://github.com/kata198/rextract"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python')
source=("https://github.com/kata198/rextract/archive/${pkgver}.tar.gz")
sha512sums=("0741e326df23b88cd5f80708a9d1db30fc7ce170f5b945cfb2f8120905782163239bea9f1e652fa0895386eed0e5ca8f5fe67fd9aa36b20299a91f83d6916a5c")

build() {
  cd "$srcdir"/rextract-$pkgver
  python setup.py build
}

package() {
  cd rextract-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
