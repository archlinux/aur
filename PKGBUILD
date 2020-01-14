# Maintainer: Alex Dewar <a.dewar@sussex.ac.uk>
pkgname=code-headmelted-bin
_pkgver=1.42.0
_date=2020_01_13
_url=https://github.com/headmelted/codebuilds/releases/download/13-Jan-20
_armhf_build=1578878180
_arm64_build=1578878212
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
md5sums_armv7h=('10650409f5c7095a7304ca0624301674')
md5sums_aarch64=('de7e11e7fa0d4ab08d72bc758b399bc0')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"

  cd "$pkgdir"
  mkdir -p usr/bin
  ln -s /usr/share/code-oss/bin/code-oss usr/bin
}
