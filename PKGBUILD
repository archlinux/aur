# Maintainer: Jiayi Wu <wjy@516wjy.xyz>
pkgname='zff-reload'
pkgver='6.0.15beta'
pkgrel=1
pkgdesc="New Zff, the lightest adventure game."
arch=('any')
url='https://github.com/ohzff/Zff-Reload'
license=('MIT')
groups=()
depends=()
makedepends=('gcc')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=('SKIP')

# prepare(){
#     if [ ! -d "$pkgname-$pkgver" ]
#     then
#         tar -xf "$pkgname-$pkgver.tar.gz"
#     fi
# }

build(){
    cd "Zff-Reload-$pkgver"
    rm ./lib/system/data/DATA.hpp
    cp ./lib/system/data/DATA_usr.hpp ./lib/system/data/DATA.hpp
    g++ ./main.cpp -o zff -std=c++11 -pthread
}

package(){
    cd "Zff-Reload-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
    cp "./zff" "$pkgdir/usr/bin/zff"
    mkdir -p "$pkgdir/usr/share/zff_reload"
    cp -r "./usr" "$pkgdir/usr/share/zff_reload/"
    cp "./LICENCE" "$pkgdir/usr/share/zff_reload/"
    cp "./README.md" "$pkgdir/usr/share/zff_reload/"
}
