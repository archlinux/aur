#Maintainer: Kimiblock

pkgname=firefox-extension-violentmonkey-bin
url="https://github.com/violentmonkey/violentmonkey"
pkgver=2.16.0
pkgrel=1
makedepends=("jq" "curl")
pkgdesc="Violentmonkey provides userscripts support for browsers. It works on browsers with WebExtensions support."
arch=('any')
license=('MIT')
provides=("firefox-extension-violentmonkey")
conflicts=("firefox-extension-violentmonkey")

function package(){
	curl "https://github.com/violentmonkey/violentmonkey/releases/download/v${pkgver}/violentmonkey-${pkgver}.xpi" -o "${srcdir}/ext.xpi" -L
	install -Dm644 ext.xpi "${pkgdir}/usr/lib/firefox/browser/extensions/{aecec67f-0d10-4fa7-b7c7-609a2db280cf}.xpi"
}

