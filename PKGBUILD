# Maintainer: dakataca <🐬danieldakataca@gmail.com>

pkgname=linux-kamakiri-bin
_pkgname=${pkgname%-bin}
pkgver=6.5.7.arch1
_tag=${pkgver%.*}
pkgrel=1
pkgdesc='Linux Kamakiri precompiled'
url='https://gitlab.com/dakataca/prebuilt-kernels'
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
    $url/-/raw/main/Archlinux/$_pkgname/$_pkgname-$pkgver-1-$arch.pkg.tar.zst{,.sig}
    $url/-/raw/main/Archlinux/$_pkgname/$_pkgname-docs-$pkgver-1-$arch.pkg.tar.zst{,.sig}
    $url/-/raw/main/Archlinux/$_pkgname/$_pkgname-headers-$pkgver-1-$arch.pkg.tar.zst{,.sig}
)
sha256sums=('ff14e9f1d0410ebb563e6613172c003674d34794909453f81135868131e0f231'
            'SKIP'
            '7920f6a29ca48faae1ec2c93789a1a499e783a25d69924d627b825bcdf537901'
            'SKIP'
            '66ced49590bdfcece558a71ad585016c8e7644bd8a82b1a2769c4f4be2d9fc19'
            'SKIP')
b2sums=('e1af1ef124053e182d2a24e5c6fae306d03bf6de6709891aeb2e04c0fa2a8f08aafc9bba2375f971c68e92f93714b2bdf48d0e2763454fa68af6ed65b736736a'
            'SKIP'
            'ace50700fea495bec7d35785ea0181f80791ca6bddf20ebd6610990ea5ab69de4c34bab2b7f09cfa896d38cab8808005f7b258f2a7259964af6d35b3ead5d94a'
            'SKIP'
            'c8996a1889c74684f4b6b4c02a764890633f3a6d3dd6dcd3796491cb50241c84c157ea195a99a778049e7422a44180eb766ea9f9d02302b46746f536b71bc473'
            'SKIP')
validpgpkeys=(
    4BA1F928CBA7CA219A14741B24FB14CFDD5D0319  # dakataca
)

# Alistar ficheros en el directorio de instalación.
package() {
    cp -r usr/ $pkgdir/
}

## Source:
# git clone https://gitlab.com/dakataca/prebuilt-kernels.git
# cd prebuilt-kernels/

## Test:
# updpkgsums
# makepkg --printsrcinfo > .SRCINFO
# git clean -dfx

# 👤 Autor: https://t.me/dakataca 💻 🐬 #
