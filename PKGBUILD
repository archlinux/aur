# Maintainer: JustKidding <jk@vin.ovh>
# Contributors: WSDMatty, Crotok, SantoZ, Det, Achilleas Pipinellis, speed145a, Schnouki

pkgname=ungoogled-chromium-bin
pkgver=78.0.3904.108
pkgrel=3
pkgdesc="A lightweight approach to removing Google web service dependency"
arch=("x86_64")
url="https://ungoogled-software.github.io/"
license=("BSD")
provides=("chromium")
conflicts=("chromium" "iridium" "ungoogled-chromium")
depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-font' 'systemd' 'dbus' 'libpulse' 'pciutils' 'json-glib' 'libva'
         'desktop-file-utils' 'hicolor-icon-theme' 'jsoncpp' 'openjpeg2' 're2'
         'snappy' 'minizip')
optdepends=('pepper-flash: support for Flash content'
            'pipewire: WebRTC desktop sharing under Wayland'
            'kdialog: needed for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kwallet: for storing passwords in KWallet'
            'libva-intel-driver: for hardware video acceleration with Intel GPUs'
            'libva-mesa-driver: for hardware video acceleration with AMD/ATI GPUs'
            'libva-vdpau-driver: for hardware video acceleration with NVIDIA GPUs')
source=("https://download.opensuse.org/repositories/home:/justkidding/Arch/x86_64/ungoogled-chromium-${pkgver}-1-x86_64.pkg.tar.xz")
sha256sums=("61cdc55e81391cb54c41c319fc2f99f3c431807951ad5f16abd586f371df60f6")

package() {
  cp -R "${srcdir}/usr/" "${pkgdir}/usr"    
  chown root $pkgdir/usr/lib/chromium/chrome-sandbox
  chmod 4755 $pkgdir/usr/lib/chromium/chrome-sandbox
}
