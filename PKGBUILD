# Maintainer: Justin Slay <justin.slay@gmail.com>
pkgname=fw-fanctrl-gui-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Graphical fan curve editor and tray controller for fw-fanctrl on Framework laptops"
arch=('x86_64')
url="https://github.com/jslay88/fw-fanctrl-gui"
license=('MIT')
depends=('fw-fanctrl' 'webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3' 'openssl' 'hicolor-icon-theme')
optdepends=('gnome-shell-extension-appindicator: tray icon support on GNOME Shell')
provides=('fw-fanctrl-gui')
conflicts=('fw-fanctrl-gui')
options=('!strip')
source=(
  "${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/fw-fanctrl-gui_${pkgver}_amd64.deb"
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/jslay88/fw-fanctrl-gui/v${pkgver}/LICENSE"
)
sha256sums=('b192fd1ae7e5f878243a12b435c248be69fffaaaf2c17b2184e0806a621c880f' 'f796518785096a46cae6ef35e1bbba60fa9879767561ec0e78607854f9720eb8')

package() {
  tar -xf data.tar.gz -C "$pkgdir"
  install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
