# Maintainer: Arti Zirk <arti@zirk.me>
pkgname=hunspell-et
pkgver=20030606
pkgrel=1
pkgdesc='Estonian hunspell dictionary'
arch=('any')
url='http://www.meso.ee/~jjpp/speller/'
license=('LGPL')
depends=('hunspell' 'hyphen')
source=("http://www.meso.ee/~jjpp/speller/ispell-et_$pkgver.tar.gz")
sha256sums=('4aea338eef90a977134e81e075277912938ce1a97344d7a0dbf238e274a86116')

package() {
	cd ispell-et-$pkgver
	install -Dm644 latin-9/et_EE.aff "$pkgdir/usr/share/hunspell/et_EE.aff"
	install -Dm644 latin-9/et_EE.dic "$pkgdir/usr/share/hunspell/et_EE.dic"

	install -dm755 "$pkgdir/usr/share/myspell/dicts"
	ln -s /usr/share/hunspell/et_EE.aff "$pkgdir/usr/share/myspell/dicts"
	ln -s /usr/share/hunspell/et_EE.dic "$pkgdir/usr/share/myspell/dicts"

	install -Dm644 hyph_et.dic "$pkgdir/usr/share/hyphen/hyph_et_EE.dic"
	install -Dm644 README "$pkgdir/usr/share/doc/hunspell-et/README"
}
