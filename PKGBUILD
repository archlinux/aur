# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgdesc='Serif family for text with Cyrillic support'
pkgbase=ttf-lora-cyrillic
pkgname=(ttf-lora-cyrillic otf-lora-cyrillic ttf-lora-cyrillic-variable)
pkgver=3.001
pkgrel=3
arch=(any)
license=(custom:OFL)
conflicts=(ttf-lora-cyrillic-ibx)
replaces=(ttf-lora-cyrillic-ibx)
url=http://www.cyreal.org/2012/07/lora/
source=("https://github.com/cyrealtype/Lora-Cyrillic/releases/download/v${pkgver}/Lora-v${pkgver}.zip"
        "https://github.com/cyrealtype/Lora-Cyrillic/raw/v${pkgver}/OFL.txt")
b2sums=('ed007cd3705e042c481491ad68df7a84c728089123e6885e8796470ff132fffe48fe687c12ab2df312ed46502a9f7a4cb50fee6d8a43b5b8baa3f625fa4b8115'
        'e118ba71dc5e5bf2a801876934a13bcc5a4faeb0096f712e0b9eb5d01a7c37b3fdd3c702e2891c2ff1842d0abae6fbe2597cabb072cc6edb483562a24b71e734')

_package ()
{
	install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
	install -m755 -d "${pkgdir}/usr/share/fonts/${pkgnme}"
	install -m755 -t "${pkgdir}/usr/share/fonts/${pkgnme}" "$@"
}

package_ttf-lora-cyrillic () {
	_package fonts/TTF/*.ttf
}

package_otf-lora-cyrillic () {
	_package fonts/otf/*.otf
}

package_ttf-lora-cyrillic-variable () {
	_package fonts/variable/*.ttf
}
