# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=python-huffman11-git
pkgver=0.17.8f52c1a
pkgrel=1
pkgdesc='Huffman decompression for version 11.x Intel ME modules'
arch=('any')
url='https://github.com/IllegalArgument/Huffman11'
license=('GPL3')
makedepends=('python-setuptools')
source=("${pkgname}::git+${url}#branch=master"
        'setup.py')
sha256sums=('SKIP'
            '9f86e5e02300c602a22506c7df4a432d55fa902771ad0831b90b471f9424ea57')

pkgver() {
  cd "${srcdir}/${pkgname}"
  echo 0.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir"
  python3 setup.py build
}

package() {
  cd "$srcdir"
  python3 setup.py install --root="$pkgdir"
}
