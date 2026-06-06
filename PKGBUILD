# Maintainer: Rudolf Schmidt <info@rudolfschmidt.com>
pkgname=simplex-desktop
pkgver=6.5.4
pkgrel=1
pkgdesc="The first messaging platform that has no user identifiers — desktop GUI client"
arch=('x86_64')
url="https://simplex.chat"
license=('AGPL-3.0-only')
depends=(
    'alsa-lib'
    'brotli'
    'e2fsprogs'
    'expat'
    'fontconfig'
    'freetype2'
    'glib2'
    'gmp'
    'graphite'
    'harfbuzz'
    'libbsd'
    'libdrm'
    'libglvnd'
    'libgpg-error'
    'libmd'
    'libpng'
    'libx11'
    'libxcb'
    'libxext'
    'libxi'
    'libxrender'
    'libxtst'
    'openssl'
    'pcre'
    'xdg-utils'
    'zlib'
)
provides=('simplex-desktop')
conflicts=('simplex-desktop-bin')
source=("simplex-desktop-${pkgver}.deb::https://github.com/simplex-chat/simplex-chat/releases/download/v${pkgver}/simplex-desktop-ubuntu-24_04-x86_64.deb")
sha256sums=('ccd538f7a65d6f7a5f32e5e4a149ad243efcdc79b0f1d2b449949d5ca4471223')

package() {
    cd "${srcdir}"
    tar --zstd -xf data.tar.zst -C "${pkgdir}"

    install -d "${pkgdir}/usr/share/applications"
    ln -s /opt/simplex/lib/simplex-simplex.desktop "${pkgdir}/usr/share/applications/simplex.desktop"

    install -d "${pkgdir}/usr/bin"
    ln -s /opt/simplex/bin/simplex "${pkgdir}/usr/bin/simplex-desktop"
}
