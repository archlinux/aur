# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mydict-bin
pkgver=0.6.14
pkgrel=4
pkgdesc='A Chinese and English dictionary.一款中英文词典'
arch=(x86_64)
url="https://github.com/xxNull-lsk/my_dict"
license=('BSD')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'qt5-websockets'
    'libsm'
    'mtdev'
    'ncurses'
    'qt5-declarative'
    'libgcrypt'
    'gstreamer'
    'libvorbis'
    'libxkbcommon'
    'sqlite'
    'krb5'
    'bzip2'
    'libxkbcommon-x11'
    'xcb-util-keysyms'
    'libbsd'
    'libxcomposite'
    'libgpg-error'
    'pango'
    'libxcb'
    'qt5-svg'
    'libpulse'
    'e2fsprogs'
    'qt5-wayland'
    'orc'
    'libxdamage'
    'libcap'
    'gst-plugins-base-libs'
    'xcb-util-renderutil'
    'libice'
    'libdrm'
    'libxinerama'
    'libevdev'
    'systemd-libs'
    'fontconfig'
    'xz'
    'libxtst'
    'libx11'
    'libxi'
    'libsndfile'
    'libxext'
    'xcb-util-image'
    'libxfixes'
    'libxrender'
    'alsa-lib'
    'libxcursor'
    'libxcrypt-compat'
    'at-spi2-core'
    'gdk-pixbuf2'
    'libpng'
    'qt5-base'
    'lz4'
    'graphite'
    'libglvnd'
    'libinput'
    'cairo'
    'libogg'
    'freetype2'
    'libdatrie'
    'zstd'
    'wayland'
    'libthai'
    'libxrandr'
    'expat'
    'util-linux-libs'
    'libgudev'
    'libasyncns'
    'xcb-util-wm'
    'qt5-multimedia'
    'gtk3'
    'fribidi'
    'openssl-1.1'
    'keyutils'
    'pixman'
    'harfbuzz'
    'libepoxy'
    'libselinux'
)
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_arch_linux_x64_${pkgver}.tar.gz")
sha256sums=('505769645eed49ed19d6fd39dd5a1c8fd5b9bef8f262b34a45fbb03d7265e66d')
build() {
    gendesk -q -f -n --exec "${pkgname%-bin}" --categories "Utility" --name "MyDict"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}/res/dict.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}