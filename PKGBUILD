# pkgver is kept in sync with pubspec.yaml by .github/workflows/version-bump.yml (same as Android).
# Binary URL uses v${pkgver} GitHub Release — CI publishes to AUR after each release if AUR_SSH_PRIVATE_KEY is set.

pkgname=asteriaray-bin
pkgver=1.0.14
pkgrel=1
pkgdesc='VPN client (VLESS / AmneziaWG) — Flutter Linux bundle'
arch=('x86_64')
url='https://github.com/Reei-dp/AsteriaRay'
license=('MIT')
depends=('gtk3' 'glib2' 'libsecret' 'libepoxy' 'hicolor-icon-theme' 'zenity')
provides=('asteriaray')
conflicts=('asteriaray')
options=('!strip')
source=("asteriaray-${pkgver}-linux-x64.tar.xz::https://github.com/Reei-dp/AsteriaRay/releases/download/v${pkgver}/asteriaray-${pkgver}-linux-x64.tar.xz")
sha256sums=('8923dd48a53389010e2af67c69c8487f07ec480acf671bf42b780bfcdf65e20c')

package() {
  install -dm755 "$pkgdir/opt/asteriaray"
  cp -a "$srcdir"/* "$pkgdir/opt/asteriaray/"
  chmod +x "$pkgdir/opt/asteriaray/asteriaray"
  install -dm755 "$pkgdir/usr/bin"
  ln -sf /opt/asteriaray/asteriaray "$pkgdir/usr/bin/asteriaray"
}
