# Maintainer: czyt <czytcn@gmail.com>
pkgname=qianji-bin
pkgver=4.5.2
pkgrel=3
pkgdesc="QianJi personal finance desktop application (钱迹个人记账)"
arch=('x86_64')
url="https://qianjiapp.com"
license=('custom')
depends=('at-spi2-core' 'cairo' 'dbus' 'fontconfig' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'harfbuzz' 'libepoxy' 'libgcc' 'libstdc++' 'pango' 'sqlite' 'zlib')
provides=('qianji')
conflicts=('qianji')
makedepends=('libarchive')
_assetver="v4.5.2-2-1560-d36e8f8f"
_tagver="4.5.2-2"
_asset="qianji_${_assetver}_x86_64.pkg.tar.zst"
source=("${_asset}::https://github.com/litangtech/Qianji-Linux-Release/releases/download/v${_tagver}/${_asset}")
sha256sums=('9bdc1220749896f27b4527b21cf24ae7c3dc43fb14261cbc3d08c0794c840bf3')

package() {
    # Reuse the upstream Arch package, excluding its metadata files
    bsdtar -xf "${srcdir}/${_asset}" -C "${pkgdir}" \
        --exclude='.PKGINFO' --exclude='.MTREE' --exclude='.BUILDINFO'
}
