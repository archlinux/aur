# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

pkgname=asus-aurora
pkgver=3.5.7
pkgrel=2
pkgdesc="A utility to control RGB keyboard back-light and charging threshold for Asus TUF-gaming laptops"
arch=('x86_64')
url="https://github.com/legacyO7/Aurora"
license=('MIT')
source=(https://github.com/legacyO7/Aurora/releases/download/3.5.7-stable%2B1/aurora_3.5.7-stable+1_amd64.deb)
sha256sums=('5d41fc8ce533f2cde2cf7f07ab7bb9cf929b4504a4ddef751c6f690f61d59516')

prepare() {
    bsdtar -xpf data.tar.zst
}

package() {
    echo "Use at your own risk! The app modify system permissions!!"
    exit -1
    cd "$srcdir"
    cp -dr --no-preserve=ownership opt $pkgdir/opt
    cp -dr --no-preserve=ownership usr $pkgdir/usr
}
