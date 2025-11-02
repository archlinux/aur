# Maintainer: Shahzeb Khattak <shahzebkhattak@proton.me>

pkgname=proton-vpn-cli
pkgver=0.1.0
pkgrel=1
pkgdesc="Proton VPN Command Line Interface (currently needs extra-testing enabled)"
arch=('any')
license=('GPL3')
url="https://protonvpn.com"
depends=(
  'python>=3.13'
  'python-dbus-fast'
  'python-packaging'
  'python-proton-keyring-linux>=0.1.0'
  'python-proton-vpn-api-core>=4.12.1'
  'python-proton-core>=0.7.0'
  'python-proton-vpn-network-manager>=0.9.0'
  'python-proton-vpn-local-agent'
)
source=("https://repo.protonvpn.com/fedora-42-unstable/proton-vpn-cli/${pkgname}-${pkgver}-1.fc42.noarch.rpm")
sha256sums=('3bcaa8f55a577e204643c6ffa9566fcb08fd79cb37325d406ea234fd5a96ac9d')

prepare() {
  mkdir -p "$srcdir/extracted-files"
  echo "Extracting ProtonVPN CLI..."
  bsdtar -xf "$srcdir/${pkgname}-${pkgver}-1.fc42.noarch.rpm" -C "$srcdir/extracted-files"
}

package() {
  echo "Copying ProtonVPN CLI files..."
  cp -r "$srcdir/extracted-files/usr" "$pkgdir/"
}
