# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kevin Baxmann <kvbx@kvbx.de>
# Contributor: Arne Hoch <arne@derhoch.de>

pkgname=sqlcl
pkgver=21.3.2.287.1503
pkgrel=1
pkgdesc="SQL Developer command line interface for Oracle"
arch=('any')
url="https://oracle.com/database/technologies/appdev/sqlcl.html"
license=('custom')
depends=('java-runtime>=8')
source=("$pkgname-$pkgver.zip::https://download.oracle.com/otn_software/java/sqldeveloper/$pkgname-$pkgver.zip"
	      "$pkgname.sh"
				'LICENSE')
sha256sums=('96f6b2bacd8811b07f2aa88ef622111a91982914ff87ba19676ffbf66b87dc17'
            '34c5f2be48639dcd8ec9f38f950916a394ae399a0e583fbde4020acdccf951e0'
            '8f5642d74925ba3a4543c52b7a84b65c18aaa7dd3599c141e72ad5117e748929')

PURGE_TARGETS=(*.exe *.txt)

package() {
	install -d "$pkgdir/opt/$pkgname/"
	cp -a --no-preserve=ownership,mode "$pkgname"/* "$pkgdir/opt/$pkgname/"
	install -D "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
