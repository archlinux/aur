# Maintainer: Alex Dewar <a.dewar@sussex.ac.uk>
pkgname=code-headmelted-bin
pkgver=1.32.0
pkgrel=1
pkgdesc="Community builds of Visual Studio Code, including for ARM devices"
arch=(i686 x86_64 armv7h aarch64)
url="https://code.headmelted.com"
license=('MIT')
depends=(libnotify gnupg libxkbfile libsecret gtk3)
optdepends=("trash-cli: For moving items to trash")
provides=(code vscode-headmelted-bin)
replaces=(vscode-headmelted-bin)
conflicts=(code vscode-headmelted-bin)
_url=https://github.com/headmelted/codebuilds/releases/download/20-Feb-19
source_i686=("$_url/code-oss_1.32.0-1550645370_i386.deb")
source_x86_64=("$_url/code-oss_1.32.0-1550644812_amd64.deb")
source_armv7h=("$_url/code-oss_1.32.0-1550644722_armhf.deb")
source_aarch64=("$_url/code-oss_1.32.0-1550644676_arm64.deb")
md5sums_i686=('907ce86f3a15b7a1448aef6c7783df18')
md5sums_x86_64=('5eddfd3a70c8af45f3840d208d19417a')
md5sums_armv7h=('58dbabd3edeb08efe1c844a6db361f51')
md5sums_aarch64=('82d1333c290d92597e649f6b71b3ba2a')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"

  cd "$pkgdir"
  mkdir -p usr/bin
  ln -s /usr/share/code-oss/bin/code-oss usr/bin
}
