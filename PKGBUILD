# Maintainer: Shahzeb Khattak <shahzebkhattak at proton dot me>

pkgname=protonvpn-cli
pkgver=0.1.0
pkgrel=1
pkgdesc="ProtonVPN CLI"
arch=('any')
license=('GPL-3.0-or-later')
url="https://protonvpn.com"
depends=(
  'python>=3.13'
  'python-click'
  'python-dbus-fast'
  'python-packaging'
  'python-proton-keyring-linux'
  'python-proton-vpn-api-core'
  'python-proton-core'
  'python-proton-vpn-network-manager'
  'python-proton-vpn-local-agent'
)
source=("https://repo.protonvpn.com/fedora-42-unstable/proton-vpn-cli/proton-vpn-cli-${pkgver}-1.fc42.noarch.rpm")
sha256sums=('3bcaa8f55a577e204643c6ffa9566fcb08fd79cb37325d406ea234fd5a96ac9d')

prepare() {
  mkdir -p "$srcdir/extracted-files"
  echo "Extracting ProtonVPN CLI..."
  bsdtar -xf "$srcdir/proton-vpn-cli-${pkgver}-1.fc42.noarch.rpm" -C "$srcdir/extracted-files"
}

package() {
  echo "Copying ProtonVPN CLI files..."
  cp -r "$srcdir/extracted-files/usr" "$pkgdir/"
}
