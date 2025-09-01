# Maintainer: Methanium
pkgname=tensamin-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Super secure messaging app"
arch=('x86_64')
url="https://tensamin.methanium.net"
license=('custom')
depends=('gtk3' 'alsa-lib' 'xdg-utils' 'nss' 'libxss' 'libgcrypt' 'ttf-liberation' 'dbus' 'libpulse' 'libva' 'libffi')
optdepends=('pipewire: Screen sharing' 'kdialog: Native dialogs on KDE Plasma' 'gtk4: for --gtk-version=4' 'gnome-keyring: Password storage backend (org.freedesktop.secrets)' 'kwallet: Password storage backend on KDE Plasma')
provides=('tensamin')
conflicts=()

source_x86_64=("https://github.com/Tensamin/Frontend/releases/download/v0.1.1-desktop-apps/tensamin-linux-x64-0.1.1.deb")
sha256sums_x86_64=("b216196c38140040b7895552f364b5b887b87be386738d5601734651c6c992e8")

package() {
  bsdtar -O -xf "${srcdir}/tensamin-linux-x64-0.1.1.deb" data.tar.* \
    | bsdtar -C "${pkgdir}" --no-same-owner -xv
}
