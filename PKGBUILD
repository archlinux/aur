# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: neo.shadowsocks <neo.shadowsocks AT gmx.com>
# Contributor: Kars Wang <jaklsy g-mail>
# Contributor: Artem Klevtsov <a.a.klevtsov@gmail.com>

pkgname=lantern-bin
pkgver=10.0.0
pkgrel=1
pkgdesc="Open-source VPN for speed, privacy, and censorship circumvention"
arch=('x86_64')
url="https://lantern.io"
license=('GPL-3.0-or-later')
depends=('at-spi2-core'
         'ayatana-ido'
         'cairo'
         'fontconfig'
         'gdk-pixbuf2'
         'glib2'
         'glibc'
         'gtk3'
         'harfbuzz'
         'hicolor-icon-theme'
         'libayatana-appindicator'
         'libayatana-indicator'
         'libdbusmenu-glib'
         'libepoxy'
         'libgcc'
         'libsoup3'
         'libstdc++'
         'pango'
         'webkit2gtk-4.1'
         'zlib')
makedepends=('chrpath')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
install="${pkgname%-bin}.install"
source=("${pkgname%-bin}-${pkgver}.pkg.tar.zst::https://github.com/getlantern/lantern/releases/download/v${pkgver}/lantern-installer.pkg.tar.zst")
sha256sums=('deec2f8d44cc287aee65bbddcef76f5168e0215a20ee90be5e2eaff7158b6480')

package() {
    chrpath --replace /usr/lib/lantern/lib usr/lib/lantern/lib/*plugin.so
    cp -r usr "${pkgdir}"
}
