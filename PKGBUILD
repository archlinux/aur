# Maintainer: Mehrab Mahmud Udoy <contact@rimehrab.is-a.dev>

pkgname=ayugram-bin
pkgver=6.7.8
pkgrel=1
pkgdesc="Desktop Telegram client with good customization and Ghost mode (pre-built binary)"
arch=('x86_64')
url="https://github.com/AyuGram/AyuGramDesktop"
license=('GPL-3.0-or-later')
provides=('ayugram-desktop')
conflicts=('ayugram-desktop' 'ayugram-desktop-bin' 'ayugram-desktop-git')
options=('!strip' '!debug')

depends=(
    'abseil-cpp'
    'ada'
    'ffmpeg'
    'glib2'
    'glibc'
    'hicolor-icon-theme'
    'hunspell'
    'kcoreaddons'
    'libavif'
    'libdispatch'
    'libgcc'
    'libheif'
    'libjpeg-turbo'
    'libjxl'
    'libpipewire'
    'libstdc++'
    'libvpx'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'libxtst'
    'lz4'
    'minizip'
    'openal'
    'openh264'
    'openssl'
    'opus'
    'protobuf'
    'qt6-base'
    'qt6-declarative'
    'qt6-svg'
    'qt6-wayland'
    'rnnoise'
    'xcb-util-keysyms'
    'xxhash'
    'zlib'
)

optdepends=(
    'geoclue: geoinformation support'
    'crow-translate: translation provider'
    'qt6-imageformats: support for additional image formats'
    'webkit2gtk-4.1: embedded browser features provided by webkit2gtk-4.1'
    'webkitgtk-6.0: embedded browser features provided by webkitgtk-6.0 (Wayland only)'
    'xdg-desktop-portal: desktop integration'
)

_pkgver="${pkgver}-5"
_src_pkg="ayugram-desktop-${_pkgver}-${CARCH}.pkg.tar.zst"

source=("${_src_pkg}::https://cdn77.cachyos.org/repo/${CARCH}/cachyos/${_src_pkg}")
sha256sums=('0c42421363df1d3aa1f391f70c4ea33a54f762c454b761a9e2cb54e2ca58d68a')

package() {
    cp -a --no-preserve=ownership "${srcdir}/usr" "${pkgdir}/"
    chmod -R u=rwX,go=rX "${pkgdir}/usr"
}
