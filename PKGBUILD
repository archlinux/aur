# Maintainer: Axel Marchand <axel1.marchand@gmail.com>
# Contributor: Axel Marchand <axel1.marchand@gmail.com>
pkgname=feather
pkgver=0.2.2
pkgrel=1
pkgdesc="A Lightweight Window Manager"
arch=(any)
url="https://github.com/AxelMarchand/Feather"
license=('MIT')
depends=('libx11')
makedepends=('make' 'gcc' 'pkg-config')
source=('https://github.com/AxelMarchand/Feather/releases/download/v0.2.2/feather-0.2.2.tar.gz')
md5sums=('3bc351fc0a7270f6d4ce7d4d32efa582')

build() {
    cd $srcdir/$pkgname-$pkgver

    make || return 1
    make clean
}

package() {
    cd $srcdir/$pkgname-$pkgver
    make install || return 1
}
