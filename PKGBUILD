# Maintainer: Alex Dewar <a.dewar@sussex.ac.uk>
pkgname=code-headmelted-bin
_pkgver=1.44.0
_date=2020-03-30
_fdate=`date --date=$_date '+%d-%b-%y'`
_url=https://github.com/headmelted/codebuilds/releases/download/$_fdate
_armhf_build=1585531024
_arm64_build=1585531075
pkgver="${_pkgver}_${_date//-/}"
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
md5sums_armv7h=('8f62b15408974d0c78b7e35b087a4bec')
md5sums_aarch64=('c346e8a9f870138bcb3e0a82ec13f0ce')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"

  cd "$pkgdir"
  mkdir -p usr/bin
  ln -s /usr/share/code-oss/bin/code-oss usr/bin
}
