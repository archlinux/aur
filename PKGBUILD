# Maintainer: Jesse Hills <3060199+jesserockz@users.noreply.github.com>
pkgname=esphome-desktop-bin
pkgver=0.8.3
pkgrel=1
pkgdesc="Desktop application for ESPHome (pre-built binary)"
arch=('x86_64')
url="https://github.com/esphome/esphome-desktop"
license=('Apache-2.0')
depends=(
    'alsa-lib'
    'cairo'
    'dbus'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libgcc'
    'libpulse'
    'libsoup3'
    'libayatana-appindicator'
    'webkit2gtk-4.1'
)
conflicts=('esphome-desktop')
source=("$pkgname-$pkgver.deb::$url/releases/download/v${pkgver}/ESPHome.Builder_${pkgver}_amd64.deb")
sha256sums=('7d083869e1e011fbbc90987ba0360e79dccb23f08016ca6e74a0bcd3ae986009')
options=('!strip')

package() {
    cd "$srcdir"
    bsdtar -xf data.tar.gz -C "$pkgdir"
}
