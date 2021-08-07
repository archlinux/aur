# Maintainer: Caleb Maclennan <caleb@alerque.com>

_fname=reem-kufi
pkgbase=$_fname-font
pkgname=(otf-$_fname ttf-$_fname)
pkgver=1.100
_tag=${pkgver%00}
pkgrel=1
pkgdesc='A Kufic typeface based on early Kific modeles retrofitted to the Fatimid Kufic grid'
arch=(any)
url="https://github.com/aliftype/$_fname"
license=(AGPL3)
provides=("$pkgbase")
provides=("$pkgbase")
_archive="ReemKufi-$_tag"
source=("$url/releases/download/v$_tag/$_archive.zip")
sha256sums=('1d9a573ff9f5db70556d96e11c321ea9d766b18f4be06912e9930ec00fe48ea1')

package_otf-reem-kufi() {
	cd "$_archive"
	install -Dm0644 -t "$pkgdir/usr/share/fonts/OTF" *.otf
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.txt
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}

package_ttf-reem-kufi() {
	cd "$_archive"
	install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF" ttf/*.ttf
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.txt
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}
