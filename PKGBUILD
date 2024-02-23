pkgname=heart-of-darkness-demo
pkgver=1.3_kelloggs_en
pkgrel=1
pkgdesc='Heart of Darkness Demo running under hode engine'
arch=(any)
url=https://heartofdarkness.ca/
license=('custom:All rights reserved')
depends=(hode-git)
_url=https://archive.org/download/hode_demo
source=(
	'Heart Of Darkness Mini-Game.7z'::$_url/Heart%20Of%20Darkness%20Mini-Game.7z
	$_url/hod_demo.paf.7z)
noextract=(
	"${source/:*}"
	hod_demo.paf.7z)
md5sums=(
	d28eccfb80c4e568635ae2e0e4c70b21
	deea00e4197732661c6bc705bff862b2)
package(){
	bsdtar xf "${source/:*}"
	mkdir -p "$pkgdir"/usr/share/$pkgname
	mv 'Heart Of Darkness Mini-Game'/*{/,.}* "$pkgdir"/usr/share/$pkgname
	bsdtar xf hod_demo.paf.7z -C"$pkgdir"/usr/share/$pkgname
}
