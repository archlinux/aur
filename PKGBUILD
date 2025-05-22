pkgname=unzip-bsdunzip-symlink
pkgver=6.0
pkgrel=3
pkgdesc='A drop-in for unzip by bsdunzip to omit makedepends'
url='http://infozip.sourceforge.net/UnZip.html'
arch=('any')
license=('custom')
depends=(bash libarchive)
conflicts=('unzip')
provides=('unzip')
source=("https://downloads.sourceforge.net/infozip/unzip60.tar.gz"
'funzip.sh' )
sha256sums=('036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37'
            'ea7a642d06e6be7b36f57dbd343988b1c370ba7f4e3b6cfa3b50dce4d91fec99')
options=(!strip !debug)

package() {
	install -Dm 755 funzip.sh "$pkgdir"/usr/bin/funzip
	ln -sf /usr/bin/bsdunzip "${pkgdir}"/usr/bin/unzip
	mkdir -p "${pkgdir}"/usr/share/man/man1
	ln -sf /usr/share/man/man1/bsdunzip.1.gz "${pkgdir}"/usr/share/man/man1/unzip.1.gz
	install unzip60/unix/zipgrep "${pkgdir}"/usr/bin/zipgrep
}
