# Maintainer GI Jack <GI_Jack@hackermail.com>
# Poached from ArchStrike <team@archstrike.org>

pkgname=windows-binaries
pkgver=0.6.10
pkgrel=1
pkgdesc="A colleciton of pentesting Windows binaries"
arch=('any')
license=('GPL2')
url="http://ftp.cc.uoc.gr/mirrors/linux/kali/kali/pool/non-free/w/windows-binaries/"
source=("http://ftp.cc.uoc.gr/mirrors/linux/kali/kali/pool/non-free/w/windows-binaries/windows-binaries_${pkgver}.tar.xz")
options=('!strip')
sha512sums=('8fd539bda7b333fa51671ebcd6b080e495f24236f256b86a0d407ecc4b694c52ce22a756ef0558b8ae8de0d10ba491278e8c296b4b7d606f2dd822ce64edd8f8')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Make base directories.
  install -dm755 "${pkgdir}/usr/share/windows-binaries"
  cp -a --no-preserve=ownership ./* "${pkgdir}/usr/share/windows-binaries"
  # Removing debian crap
  rm -rf "${pkgdir}/usr/share/windows-binaries/debian"
}
