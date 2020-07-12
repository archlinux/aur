# Maintainer GI Jack <GI_Jack@hackermail.com>
# Poached from ArchStrike <team@archstrike.org>

pkgname=windows-binaries
pkgver=0.6.9
pkgrel=1
pkgdesc="A colleciton of pentesting Windows binaries"
arch=('any')
license=('GPL2')
url="http://ftp.cc.uoc.gr/mirrors/linux/kali/kali/pool/non-free/w/windows-binaries/"
source=("http://ftp.cc.uoc.gr/mirrors/linux/kali/kali/pool/non-free/w/windows-binaries/windows-binaries_${pkgver}.tar.xz")
options=('!strip')
sha512sums=('5dd848c4820c6c078de0c6ebb01a3c9a35362d7c85aa4f1220050a1093f9105994fd1caf93927af8ad88feb873d41cc58ffd11fa08343ff6c92f2903e196ba38')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Make base directories.
  install -dm755 "${pkgdir}/usr/share/windows-binaries"
  cp -a --no-preserve=ownership ./* "${pkgdir}/usr/share/windows-binaries"
  # Removing debian crap
  rm -rf "${pkgdir}/usr/share/windows-binaries/debian"
}
