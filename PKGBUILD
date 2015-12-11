# Maintainer:  Einhard Leichtfuß <respiranto@icloud.com>
pkgname=dict-wikt-en-all
pkgver=2014_09_14
pkgrel=1
pkgdesc="The english Wiktionary for dictd et al."
arch=('any')
url="http://www.dictinfo.com/"
# Wiktionary: CC BY-SA and FDL; Conversion: public domain
license=('CCPL:by-sa' 'FDL' 'custom:public domain')
optdepends=('dictd: dict client and server')
install="$pkgname.install"
source=("http://dictinfo.com/dictd/wikt-en-ALL-${pkgver//_/-}-dictd.7z"
"license.txt")
md5sums=('3c8a83faf59aae5eafc6aeda5beb5af3'
'9075d8a64f50a9c41e937707786be654')

package()
{
	mkdir -p "$pkgdir/usr/share/dictd"
	cp "wikt-en-ALL-${pkgver//_/-}.dict.dz" \
		"$pkgdir/usr/share/dictd/wikt-en-all.dict.dz"
	cp "wikt-en-ALL-${pkgver//_/-}.index" \
		"$pkgdir/usr/share/dictd/wikt-en-all.index"
	
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	cp "license.txt" "$pkgdir/usr/share/licenses/$pkgname/"
}
