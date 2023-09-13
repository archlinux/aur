# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
pkgname=dict-wikt-en-all
pkgver=2023_07_27
pkgrel=1
pkgdesc="The english Wiktionary for dictd et al."
arch=('any')
url="https://www.dictinfo.com/"
# Wiktionary: CC BY-SA and FDL; Conversion: public domain
license=('CCPL:by-sa' 'FDL' 'custom:public domain')
optdepends=('dictd: dict client and server')
install="$pkgname.install"
source=("https://dictinfo.com/dictd/wikt-en-ALL-${pkgver//_/-}-dictd.7z"
        "license.txt")
sha512sums=('56099a6a1fd16df2e13d8ce3a2bb96df6fdfa3f6dd10e03374d5e2a582fc619c34d60c87b78bba5910365fd29ffa9841cf30eb9c58562b4d63f56ca951ad60c1'
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
