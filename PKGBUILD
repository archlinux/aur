pkgname=unzip-bsdunzip-symlink
pkgver=6.0
pkgrel=4
pkgdesc='funzip,zipgrep,and unzip-shim by libarchive (makedeps and -O only)'
url='http://infozip.sourceforge.net/UnZip.html'
arch=('any')
license=('LicenseRef-Info-ZIP')
depends=(bash libarchive)
conflicts=('unzip')
provides=('unzip')
source=("https://downloads.sourceforge.net/infozip/unzip60.tar.gz"
'funzip.sh' )
sha256sums=('036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37'
'909df4550b52139ea588e8f4e98f613ff25f02c3444d5dc188e8461a1f9b40de')
options=(!strip !debug)

package() {
  install -Dm755 funzip.sh "$pkgdir"/usr/bin/funzip
  ln -sf /usr/bin/bsdunzip "${pkgdir}"/usr/bin/unzip
  install -Dm644 unzip60/man/zipgrep.1 "${pkgdir}"/usr/share/man/man1/zipgrep.1
  install -Dm644 unzip60/man/funzip.1 "${pkgdir}"/usr/share/man/man1/funzip.1
  ln -sf /usr/share/man/man1/bsdunzip.1.gz "${pkgdir}"/usr/share/man/man1/unzip.1.gz
  install unzip60/unix/zipgrep "${pkgdir}"/usr/bin/zipgrep
  install -Dm644 unzip60/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
