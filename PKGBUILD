# Maintainer: Artem Stasyuk <stasyukartem2@gmail.com>
pkgname=onetagger-bin
pkgver=1.7.1
pkgrel=0
pkgdesc="The ultimate cross-platform tagger for DJs"
arch=('x86_64')
url="https://onetagger.github.io/"
license=('GPL3')
depends=(
    'webkit2gtk'
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
source=("https://github.com/XCroatoanX/onetagger/releases/download/1.7.1/OneTagger-linux.tar.gz"
        "onetagger.png"
        "onetagger.desktop")
sha256sums=('8bc400eadcdd5bcc72ce8bf9e91d1faa6e6b2f8f85deac4b87f12cfe97888726'
            '6a0ecc9b2f8d4f2ebb7f168c3158feadaa0a391837034df8856a0c0bde3219aa'
            '308891e4556f602afedfbc5bd9c0ef35b49ff56329cb53ffeb870017b52cbf3d')

package() {
    mkdir -p "$pkgdir/usr/bin"
    tar -xzf "$srcdir/OneTagger-linux.tar.gz" -C "$pkgdir/usr/bin"
    chmod +x "$pkgdir/usr/bin/onetagger"
    install -Dm 644 "${srcdir}/onetagger.png" -t "${pkgdir}/usr/share/pixmaps/"
    install -Dm 644 "${srcdir}/onetagger.desktop" -t "${pkgdir}/usr/share/applications/"
}
