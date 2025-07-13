# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
pkgname=dict-wikt-en-all
pkgver=2024_10_05
pkgrel=1
pkgdesc="The english Wiktionary for dictd et al."
arch=('any')
url="https://www.dictinfo.com/"
# Wiktionary: CC BY-SA and FDL; Conversion: public domain
license=('CCPL:by-sa' 'FDL' 'custom:public domain')
optdepends=('dictd: dict client and server')
install="${pkgname}.install"
source=("https://dictinfo.com/dictd/wikt-en-ALL-${pkgver//_/-}-dictd.7z"
        "license.txt")
sha512sums=('ede1bed80f1945852c913bcb646f6a5502cf0322c2081862180d5fd1faf81a7579dcc74b51579bef0b68669a283c14fb5d83dff2f055540535239b59871c6a85'
            '3c88db50b374bb63123becec2fc9bc9568fd364345fe66daab64e559eaf51b108d4fe27651989e8e4ae1135152761ae7dde9c484349ecb1621fd1e30ae31adb9')

package()
{
	install -m 0755 -d "${pkgdir}/usr/share/dictd"
	install -m 0644 "wikt-en-ALL-${pkgver//_/-}.dict.dz" \
		"${pkgdir}/usr/share/dictd/wikt-en-all.dict.dz"
	install -m 0644 "wikt-en-ALL-${pkgver//_/-}.index" \
		"${pkgdir}/usr/share/dictd/wikt-en-all.index"
	
	install -m 0755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -m 0644 "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vi: ft=sh ts=2 sw=0 noet
