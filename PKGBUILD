# Maintainer: Alex Dewar <a.dewar@sussex.ac.uk>
pkgname=code-headmelted-bin
_pkgver=1.43.0
_date=2020_02_17
_url=https://github.com/headmelted/codebuilds/releases/download/17-Feb-20
_armhf_build=1581902153
_arm64_build=1581902160
pkgver="${_pkgver}_${_date}"
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
source_armv7h=("$_url/code-oss_$_pkgver-${_armhf_build}_armhf.deb")
source_aarch64=("$_url/code-oss_$_pkgver-${_arm64_build}_arm64.deb")
md5sums_armv7h=('0ec2caf17318c9a89f2c58ce20707e4a')
md5sums_aarch64=('b4d37bd2a4651fdd8d65e6f1f7bb3836')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"

  cd "$pkgdir"
  mkdir -p usr/bin
  ln -s /usr/share/code-oss/bin/code-oss usr/bin
}
