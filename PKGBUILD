# Maintainer: Methanium
pkgname=tensamin-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Super secure messaging app"
arch=('x86_64')
url="https://tensamin.methanium.net"
license=('custom')
depends=('gtk3' 'alsa-lib' 'xdg-utils' 'nss' 'libxss' 'libgcrypt' 'ttf-liberation' 'dbus' 'libpulse' 'libva' 'libffi')
optdepends=('pipewire: Screen sharing' 'kdialog: Native dialogs on KDE Plasma' 'gtk4: for --gtk-version=4' 'gnome-keyring: Password storage backend (org.freedesktop.secrets)' 'kwallet: Password storage backend on KDE Plasma')
provides=('tensamin')
conflicts=()

source_x86_64=("https://github.com/Tensamin/Frontend/releases/download/v0.1.2-desktop-apps/tensamin-linux-x64-0.1.2.deb")
sha256sums_x86_64=("9daef9fb3e2aebddf3090cd76645ebe6427ae598cd03de0a6e5756f51c6e608c")

package() {
  bsdtar -O -xf "${srcdir}/tensamin-linux-x64-0.1.2.deb" data.tar.* \
    | bsdtar -C "${pkgdir}" --no-same-owner -xv
}
