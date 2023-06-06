# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="fsrimageupscaler-bin"
pkgver=1.0.0
pkgrel=1
pkgdesc="A Electron & CLI frontend to upscale images / videos using multiple different algorithms"
arch=('x86_64')
url="https://janishutz.com/scaler.html"
_githuburl="https://github.com/simplePCBuilding/ImageVideoUpscaler"
license=('GPL3')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('fontconfig' 'rav1e' 'libidn2' 'x265' 'gtk3' 'libxml2' 'librsvg' 'systemd-libs' 'gmp' 'zlib' 'libyuv' 'libffi' 'libxinerama' \
    'libxext' 'cairo' 'tracker3' 'libde265' 'libxfixes' 'dbus' 'libxcomposite' 'glibc' 'gnutls' 'bzip2' 'libcap' 'util-linux-libs' 'gdbm' \
    'libxkbcommon' 'libgirepository' 'libxi' 'openssl-1.1' 'sqlite' 'svt-av1' 'libgcrypt' 'libxrender' 'zstd' 'gdk-pixbuf2' 'lz4' 'pixman' \
    'libheif' 'libdatrie' 'brotli' 'libproxy' 'libgpg-error' 'libjpeg-turbo' 'expat' 'pcre2' 'libx11' 'libp11-kit' 'libxcursor' 'libepoxy' \
    'dav1d' 'hicolor-icon-theme' 'libpng' 'pango' 'aom' 'fribidi' 'libxrandr' 'freetype2' 'graphite' 'harfbuzz' 'gcc-libs' 'at-spi2-core' \
    'libstemmer' 'libtasn1' 'nettle' 'wayland' 'libxcb' 'libcloudproviders' 'json-glib' 'xz' 'glib2' 'libxdamage' 'libthai' 'libwmf')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/V${pkgver}/${pkgname%-bin}.deb")
sha256sums=('b05fa12447f758d4ed48280de89e70863583b3f8d9eed55dc2118e47d5592165')
package() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
    mv "${pkgdir}/usr/share/applications/.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}