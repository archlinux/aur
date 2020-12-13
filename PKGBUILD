# Maintainer: Alex Dewar <a.dewar@sussex.ac.uk>
pkgname=code-headmelted-bin
_pkgver=1.45.0
_date=2020-04-06
_fdate=`env LANG=C date --date=$_date '+%d-%b-%y'`
_url=https://github.com/headmelted/codebuilds/releases/download/$_fdate
_armhf_build=1586135927
_arm64_build=1586135971
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
md5sums_armv7h=('c0e0d75e91fe7e363bfafec253b21767')
md5sums_aarch64=('fa74541733ba7dbcb78cd8c1fd6ebbb9')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"

  cd "$pkgdir"
  mkdir -p usr/bin
  ln -s /usr/share/code-oss/bin/code-oss usr/bin
}
