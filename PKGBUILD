# Maintainer: petRUShka <marcel[dot]korpel[at]gmail>


pkgname=balongflash-git
pkgver=r24.3f3a4b7
pkgrel=1
pkgdesc='Flashing utility for Huawei E3372 and other modems baesd on Balong v7'
arch=('i686' 'x86_64')
url='https://github.com/forth32/balongflash'
license=('GPLv3')
depends=()
makedepends=('make git gcc')
provides=()
conflicts=()
options=()

pkgver() {
    cd $pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

source=('balongflash-git::git+https://github.com/forth32/balongflash.git')
md5sums=(SKIP)

build() {
    cd $srcdir/$pkgname
    make
}

package() {
    cd $srcdir/$pkgname
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m755 balong_flash "$pkgdir/usr/bin/${pkgname%-git}"
}
