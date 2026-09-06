# Maintainer: hzxiaxz <hzxiaxz at gmail dot com>
pkgname=koushi-matrix-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Koushi (光子・格子) — Matrix desktop client built on Tauri and matrix-rust-sdk (binary release)"
arch=('x86_64')
url="https://github.com/shinaoka/koushi-matrix"
license=('MIT OR Apache-2.0')
depends=('webkit2gtk-4.1' 'gtk3' 'dbus' 'libsecret' 'openssl' 'cairo' 'gdk-pixbuf2' 'glib2' 'hicolor-icon-theme')
optdepends=(
  'gnome-keyring: Secret Service credential storage on GNOME/XFCE'
  'kwallet: Secret Service credential storage on KDE Plasma'
)
provides=('koushi-desktop')
conflicts=('koushi-desktop')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/Koushi-linux-x64.deb")
sha256sums=('6ef9d510412ee01fa355a64949f0055333ab8b1b8f26fcb3bffaad4bdd88ed72')

package() {
  bsdtar -xf data.tar.gz -C "$pkgdir"
  chmod -R go-w "$pkgdir/usr"
}
