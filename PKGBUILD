# Maintainer: Crotok <crotok [at] mailbox [dot] org>
# Contributor: SantoZ <santoz28 at mailbox dot org>
# Contributors: Det, Achilleas Pipinellis, speed145a, Schnouki

pkgname=ungoogled-chromium-bin
pkgver=76.0.3809.100
pkgrel=1
pkgdesc="Modifications to Google Chromium for removing Google integration and enhancing privacy, control, and transparency (binary version)"
arch=("x86_64")
url="https://github.com/ungoogled-software/ungoogled-chromium-binaries"
license=("BSD")
provides=("chromium")
conflicts=("chromium" "iridium" "ungoogled-chromium")
depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-font' 'systemd' 'dbus' 'libpulse' 'pciutils' 'json-glib' 'libva'
         'desktop-file-utils' 'hicolor-icon-theme' 'jsoncpp' 'openjpeg2')
optdepends=('pepper-flash: support for Flash content'
            'pipewire: WebRTC desktop sharing under Wayland'
            'kdialog: needed for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kwallet: for storing passwords in KWallet')
source=("https://github.com/hammerpavel/ungoogled-chromium-binaries/releases/download/${pkgver}-${pkgrel}/ungoogled-chromium-${pkgver}-${pkgrel}-x86_64.pkg.tar.xz")
sha256sums=("8205beb93747a3d6eb1398cc19eb45858861774ea391ed150b7ffb6286da124b")

package() {
  cp -R "${srcdir}/usr/" "${pkgdir}/usr"    
  chown root $pkgdir/usr/lib/chromium/chrome-sandbox
  chmod 4755 $pkgdir/usr/lib/chromium/chrome-sandbox
}
