# Mainained by imper <imperator999mcpe@gmail.com>
pkgname=themispp
pkgver=0.14.1
pkgrel=1
pkgdesc="Open-source high-level cryptographic services library."
url="https://github.com/cossacklabs/themis.git"
arch=('x86_64')
license=('Apache')
depends=('openssl')
makedepends=('make' 'gcc')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/cossacklabs/themis/archive/refs/tags/$pkgver.tar.gz"
        "makefile-ldconfig.patch")
md5sums=('2964eeb81492270da6bb1b43fa0a89dc'
         '5d5db18b2d72d7db21cd7f9d701c2221')

prepare()
{
    cd "themis-$pkgver"
    patch -p1 -i "$srcdir/makefile-ldconfig.patch"
}

build()
{
    cd "themis-$pkgver"
    make
}

package()
{
    cd "themis-$pkgver"
    make install PREFIX="$pkgdir/usr/"
    make themispp_install PREFIX="$pkgdir/usr/"
}
