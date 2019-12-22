# Maintainer: Alex Dewar <a.dewar@sussex.ac.uk>
pkgname=code-headmelted-bin
pkgver=1.42.0
pkgrel=1
pkgdesc="Community builds of Visual Studio Code, including for ARM devices"
arch=(armv7h aarch64)
url="https://code.headmelted.com"
license=('MIT')
depends=(libnotify gnupg libxkbfile libsecret gtk3 libxss nss)
optdepends=("trash-cli: For moving items to trash")
provides=(code vscode-headmelted-bin)
replaces=(vscode-headmelted-bin)
conflicts=(code vscode-headmelted-bin)
_url=https://github.com/headmelted/codebuilds/releases/download/10-Dec-19
source_armv7h=("$_url/code-oss_$pkgver-1575959634_armhf.deb")
source_aarch64=("$_url/code-oss_$pkgver-1575959662_arm64.deb")
md5sums_armv7h=('f984c8cfd2f7826b5793da14436c54ef')
md5sums_aarch64=('b2f20657be5db0280e15db05ad9cabe0')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"

  cd "$pkgdir"
  mkdir -p usr/bin
  ln -s /usr/share/code-oss/bin/code-oss usr/bin
}
