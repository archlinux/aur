# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: neo.shadowsocks <neo.shadowsocks AT gmx.com>
# Contributor: Kars Wang <jaklsy g-mail>
# Contributor: Artem Klevtsov <a.a.klevtsov@gmail.com>

pkgname=lantern-bin
pkgver=8.3.7
pkgrel=1
pkgdesc="A censorship circumvention tool that delivers fast, reliable, and secure access to the open internet"
arch=('x86_64')
url="https://lantern.io"
license=('Apache-2.0')
depends=('at-spi2-core'
         'ayatana-ido'
         'cairo'
         'curl'
         'fontconfig'
         'gcc-libs'
         'gdk-pixbuf2'
         'glib2'
         'glibc'
         'gst-plugins-base-libs'
         'gstreamer'
         'gtk3'
         'harfbuzz'
         'hicolor-icon-theme'
         'libayatana-appindicator'
         'libayatana-indicator'
         'libdbusmenu-glib'
         'libepoxy'
         'libsoup3'
         'pango'
         'webkit2gtk-4.1'
         'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/getlantern/lantern-binaries/raw/main/lantern-installer-${pkgver}-64-bit.deb")
sha256sums=('1e34b4c7b4c9e37d65c5eb1a8fc3e66fcbeb5a36ae99f750c016a0d2cb69a749')

package() {
    bsdtar -xf data.tar.zst -C "${pkgdir}"
    mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/bin"
    mv "${pkgdir}/usr/share/Lantern" "${pkgdir}/opt"
    ln -sf /opt/Lantern/Lantern "${pkgdir}/usr/bin/Lantern"
}
