# Maintainer: Artem Stasyuk <stasyukartem2@gmail.com>
pkgname=onetagger-bin
pkgver=1.7.2
pkgrel=1
pkgdesc="The ultimate cross-platform tagger for DJs"
arch=('x86_64')
url="https://onetagger.github.io/"
license=('GPL3')
depends=(
    'webkit2gtk'
    'webkit2gtk-4.1'
    'gtk3'
    'glib2'
    'glibc'
    'alsa-lib'
    'gcc-libs'
    'libepoxy'
    'fontconfig'
    'freetype2'
    'libwebp'
    'icu'
    'systemd'
    'libjpeg-turbo'
    'libpng'
    'sqlite'
    'pango'
    'harfbuzz'
    'atk'
    'cairo'
    'libxml2'
    'libxslt'
    'lcms2'
    'woff2'
    'libgcrypt'
    'gstreamer'
    'gst-plugins-base'
    'libdrm'
    'wayland'
    'enchant'
    'libsecret'
    'libx11'
)
optdepends=(
    'gst-plugins-good: For good GStreamer plugins'
    'gst-plugins-bad: For additional GStreamer plugins'
)
conflicts=('onetagger')
source=("https://github.com/XCroatoanX/onetagger/releases/download/1.7.2/onetagger.tar.xz"
        "onetagger.png"
        "onetagger.desktop")
sha256sums=('dce5e7f9ba85741b1ffba3ced6423cc54bc9beab21611a5747cd19cdab6d6682'
            '6a0ecc9b2f8d4f2ebb7f168c3158feadaa0a391837034df8856a0c0bde3219aa'
            '308891e4556f602afedfbc5bd9c0ef35b49ff56329cb53ffeb870017b52cbf3d')

package() {
    mkdir -p "$pkgdir/usr/bin"
    tar -xJf "$srcdir/onetagger.tar.xz" -C "$pkgdir/usr/bin"
    chmod +x "$pkgdir/usr/bin/onetagger"
    install -Dm 644 "${srcdir}/onetagger.png" -t "${pkgdir}/usr/share/pixmaps/"
    install -Dm 644 "${srcdir}/onetagger.desktop" -t "${pkgdir}/usr/share/applications/"
}
