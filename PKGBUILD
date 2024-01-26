# Maintainer: Salvatore Cirasa < info at cirasa dot dev >
pkgname=sharp-mx-c55-9-ps
pkgver=1.5
pkgrel=1
pkgdesc="PPD files for Sharp PostScript Printers(BP-40C26 to BP-70C45)"
arch=('i686' 'x86_64')
url="http://www.sharp.com"
license=('GPL')
depends=('cups')
archive="sharp-${pkgver}-mx-c55-9-ps"
source=("https://docs.aws.sharp.eu/Service_Information/Drivers/${archive}.tar")
sha512sums=('8a6fa9552eae58967af51f2537a3b14eb3681d64826454d98f1a3df9211bb2bc93bfbe19d9190721b57eaffb560d89d9f9d642debbc3def8b909a379ee752e94')

package() {
  cd "$srcdir"
  tar xf "${archive}.tar"
  mkdir -p "$pkgdir/usr/share/cups/model/Sharp"
  mv ${srcdir}/${archive}/*.ppd $pkgdir/usr/share/cups/model/Sharp/
}

