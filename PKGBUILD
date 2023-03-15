# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgdesc='Serif family for text with Cyrillic support'
pkgbase=ttf-lora-cyrillic
pkgname=(ttf-lora-cyrillic otf-lora-cyrillic ttf-lora-cyrillic-variable)
pkgver=3.005
pkgrel=1
arch=(any)
license=(custom:OFL)
conflicts=(ttf-lora-cyrillic-ibx)
replaces=(ttf-lora-cyrillic-ibx)
url=http://www.cyreal.org/2012/07/lora/
source=("https://github.com/cyrealtype/Lora-Cyrillic/releases/download/v${pkgver}/Lora-v${pkgver}.zip"
        "https://github.com/cyrealtype/Lora-Cyrillic/raw/v${pkgver}/OFL.txt")
b2sums=('e305673679462bb3a122c027fb71a5ebe530ce552c120f832a2c7c0cab2994e3e329e78dbf7495ba91deb5f31fc9b26448ccdf7bebad85c816f511ab400d2f94'
        '70f80e514981c7881da86623cb84ff419886689bc085d5ba34e16770e454ce9d9d07a7e9813b17e831c1e31572087de071fec8b2cc91363dce71c1860a7e589a')

_package ()
{
	install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
	install -m755 -d "${pkgdir}/usr/share/fonts/${pkgnme}"
	install -m755 -t "${pkgdir}/usr/share/fonts/${pkgnme}" "$@"
}

package_ttf-lora-cyrillic () {
	_package fonts/ttf/*.ttf
}

package_otf-lora-cyrillic () {
	_package fonts/otf/*.otf
}

package_ttf-lora-cyrillic-variable () {
	_package fonts/variable/*.ttf
}
