# Maintainer: dakataca <🐬danieldakataca@gmail.com>

pkgname=linux-kamakiri-bin
_pkgname=${pkgname%-bin}
pkgver=6.5.9.arch2
_tag=${pkgver%.*}
pkgrel=1
pkgdesc='Linux Kamakiri precompiled'
url='https://gitlab.com/dakataca/prebuilt-kernels'
_url="$url/-/raw/main/Archlinux/$_pkgname"
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
sha256sums=('ba34bc8a4785a5153fea82227a0c02af54438152bbc788032796efcbccbd838a'
            'f083b38155ded73e70297064e1ff8a1afd249e813a802bb1fd566a4c1f88fcba'
            '91a8194fffa7568d035f0debb726b5663fd0921f98461e269bbb4700c94495a8')
b2sums=('c113ae3fd4aa9dc4e47650c88c9a8005df54af4ae5307043253776f3685eef6b01f983466ba27da87bef671068a89fbff6957a8a96f44c37cd5e7af471046b83'
        '9cac4606ac82b334a433d323bd6fa2010cdd8c78a66fd3354e28dd764ea5c82fa4ae168a659351168ceacc7922d44d54619e591eed60d91b7062037b48a03f1c'
        '1cd5c665bdcfa1095bbe709d72e27f646846af037b9442f8d4c0f654273455cf8ad4bd148f66f00716031f381e0e4884afd6d0cf74f6a41db4767241167f1d42')

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
