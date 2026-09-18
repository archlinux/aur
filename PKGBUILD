# Maintainer: czyt <czytcn@gmail.com>
pkgname=qianji-bin
pkgver=4.5.2
pkgrel=2
pkgdesc="QianJi personal finance desktop application (钱迹个人记账)"
arch=('x86_64')
url="https://qianjiapp.com"
license=('custom')
depends=('at-spi2-core' 'cairo' 'dbus' 'fontconfig' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'harfbuzz' 'libepoxy' 'libgcc' 'libstdc++' 'pango' 'sqlite' 'zlib')
provides=('qianji')
conflicts=('qianji')
makedepends=('libarchive')
_assetver="v4.5.2-1560-961a8c0c"
_asset="qianji_${_assetver}_x86_64.pkg.tar.zst"
source=("${_asset}::https://github.com/litangtech/Qianji-Linux-Release/releases/download/v${pkgver}/${_asset}")
sha256sums=('a4b5d68a01bd2c9ae3f4eae143f15e2049bab9857fe754364cf7b4c65808a377')

package() {
    # Reuse the upstream Arch package, excluding its metadata files
    bsdtar -xf "${srcdir}/${_asset}" -C "${pkgdir}" \
        --exclude='.PKGINFO' --exclude='.MTREE' --exclude='.BUILDINFO'
}
