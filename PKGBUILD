# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
# Contributor: Foppe Hemminga <foppe@foppe.org>
pkgname=otf-cooper-hewitt
pkgver=1.000
pkgrel=5
pkgdesc="sans-serif font by Chester Jenkins"
url="https://www.cooperhewitt.org/open-source-at-cooper-hewitt/cooper-hewitt-the-typeface-by-chester-jenkins/"
arch=(any)
license=('OFL-1.1-RFN')
source=(
"$pkgname-$pkgver.zip::https://www.cooperhewitt.org/wp-content/uploads/fonts/CooperHewitt-OTF-public.zip"
)
sha256sums=('df5b0869296092fca85742a6295db8bbdedb4e1e19ecaafd195bbabd1ef22d4e')

package() {
	cd "$srcdir/CooperHewitt-OTF-public" || exit
	install -Dm644 ./*.otf -t "$pkgdir/usr/share/fonts/$pkgname/"
	install -Dm644 -- -CooperHewitt-OFL-201406.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 -- -CooperHewitt-FontLog.txt "$pkgdir/usr/share/doc/$pkgname/FontLog"
}
