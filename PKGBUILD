# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
pkgname=dict-wikt-en-all
pkgver=2018_05_15
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
sha512sums=('b4573bac4997717de784352757f26142d91f725cbdfce54fefa2efd28b56a9601207fc25d55ec0d9e31b95de46bbcfc2c34ae0780dc852989b3d4f2f5efa5d21'
            '3c88db50b374bb63123becec2fc9bc9568fd364345fe66daab64e559eaf51b108d4fe27651989e8e4ae1135152761ae7dde9c484349ecb1621fd1e30ae31adb9')

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
