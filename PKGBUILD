pkgname=unzip-bsdunzip-symlink
pkgver=6.0
pkgrel=2
pkgdesc='A cheap drop-in for unzip by bsdunzip'
url='http://infozip.sourceforge.net/UnZip.html'
arch=('x86_64')
license=('custom')
depends=('libarchive' 'dash')
conflicts=('unzip')
provides=('unzip')
source=("https://downloads.sourceforge.net/infozip/unzip60.tar.gz"
'funzip.sh' )
sha256sums=('036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37'
            '470e3039053c9d14f40391c6dc244ac6e76ae4b33ae5363f5587f8a7517dcfc2')
options=(!strip !debug)

package() {
	install -Dm 755 funzip.sh "$pkgdir"/usr/bin/funzip
	ln -sf /usr/bin/bsdunzip "${pkgdir}"/usr/bin/unzip
	install unzip60/unix/zipgrep "${pkgdir}"/usr/bin/zipgrep
}
