# Maintainer: dakataca <🐬danieldakataca@gmail.com>

pkgname=linux-kamakiri-bin
_pkgname=${pkgname%-bin}
pkgver=6.6.1.arch1
_tag=${pkgver%.*}
pkgrel=1
pkgdesc='Linux Kamakiri precompiled'
url='https://codeberg.org/dakataca/linux-kamakiri-bin'
_url="$url/src/branch/main/"
arch=(x86_64)
license=(GPL2)
depends=('coreutils' 'kmod' 'initramfs')
provides=(
    "$pkgname-docs=$_tag"
    "$pkgname-headers=$_tag"
)
conflicts=(
    "$_pkgname"
    "$_pkgname-docs"
    "$_pkgname-headers"
)
source=(
    $_url/$_pkgname-$pkgver-1-$arch.pkg.tar.zst
    $_url/$_pkgname-docs-$pkgver-1-$arch.pkg.tar.zst
    $_url/$_pkgname-headers-$pkgver-1-$arch.pkg.tar.zst
)
sha256sums=('c56c079b3224a5a28193649ca7497bff062695c190fd8b2c9e644c81ec442cf3'
            'cf83b3146468cc44f3bd9175cefad8f7afe4d89dd535a45e301cbd3de55df24b'
            '53347f281292ba08b0803b30aa7b085026230e67a0624dc94c62077611d6fdd7')
b2sums=('544835cf938118d1a7496586e5c420f9b58ab4c6b69606d97b30d07954d51e515271b9019e0659aa3240740e4854fa56fdc61a277ae40053645a201d8eb699ec'
        '4d7f76af5270ae94e853102e286c2ee14dbcf6339e7f5048bff42d989a929eaa23c3d4e02bf586cd1accd898ebc42b2719160322d41acb70fbad933926e19d27'
        '4b7240253f50f3f4d9dca29af9c4da89d24a86d1b6bd285428b5308fa4f889f2feac8a7b0acf6b582f1a6641399c7c15ac5bb4f20ab8297327c351a9ce8e9503')

# Alistar ficheros en el directorio de instalación.
package() {
    cp -r usr/ $pkgdir/
}

## Source:
# https://codeberg.org/dakataca/linux-kamakiri-bin

## Test:
# updpkgsums
# makepkg --printsrcinfo > .SRCINFO
# git clean -dfx

# 👤 Autor: https://t.me/dakataca 💻 🐬 #
