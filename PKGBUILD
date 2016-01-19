# Maintainer: Axel Marchand <axel1.marchand@gmail.com>
# Contributor: Axel Marchand <axel1.marchand@gmail.com>
pkgname=feather
pkgver=0.2.1
pkgrel=3
pkgdesc="A Lightweight Window Manager"
arch=(any)
url="https://github.com/AxelMarchand/Feather"
license=('MIT')
depends=('libx11')
makedepends=('make' 'gcc' 'pkg-config')
source=('https://github.com/AxelMarchand/Feather/releases/download/v0.2.1/feather-0.2.1.tar.gz')
md5sums=('e1349783d85f8a32e411a06f727554bd')

build() {
    cd $srcdir/$pkgname-$pkgver

    make || return 1
    make clean
}

package() {
    cd $srcdir/$pkgname-$pkgver
    make install || return 1
}
