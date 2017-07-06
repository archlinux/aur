# $Id: PKGBUILD 184754 2016-08-01 15:30:30Z felixonmars $
# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Christoph Drexler <chrdr at gmx dot at>
# Contributor: Jelle van der Waa <jellevdwaa@gmail.com>

pkgname=xmind
pkgver=3.6.51
_filename=$pkgname-7.5-update1-linux
pkgrel=1
pkgdesc="Brainstorming and Mind Mapping Software"
arch=('i686' 'x86_64')
url="http://www.xmind.net"
license=('EPL' 'LGPL')
depends=('desktop-file-utils' 'fontconfig' 'libxrender' 'java-runtime' 'shared-mime-info' 'libxext')
optdepends=('lame: needed for the feature audio notes')
source_i686=("http://www.xmind.net/xmind/downloads/${_filename}_i386.deb")
source_x86_64=("http://www.xmind.net/xmind/downloads/${_filename}_amd64.deb")
sha512sums_i686=('27b5b1eea2f5b2b085aa0ebbcb046e0aa8f146ec4619fc3b9c926021a93cd840fea0a8242975d96eabb0f5aaab95156624d6f369074dbf5f0af52d0eca07f3f4')
sha512sums_x86_64=('899c30e654396f2fea6b5e4218edddfed73729b6c733726a8a5c0c0b873f8cfd5e417e7cacdffaff25a18823458921e1d994faca6bc6cdcc0733c9a1487c7dc1')

build() {
  if [[ "$CARCH" == "i686" ]]; then
    ar x "${_filename}_i386.deb"
  else
    ar x "${_filename}_amd64.deb"
  fi
}

package() {
  bsdtar -xf data.tar.gz -C "$pkgdir"
}
