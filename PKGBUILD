# Maintainer: Scarecrow928 <yushuaibin999@gmail.com>

pkgname=poi-bin
_pkgname=poi
pkgver=10.9.0
pkgrel=1
pkgdesc="Scalable KanColle browser and tool"
arch=('x86_64')
url="https://github.com/poooi/poi/"
license=('MIT')
provides=("poi")
depends=('nss' 'gtk3')
conflicts=('poi')
options=(!strip)
source=("https://github.com/poooi/poi/releases/download/v${pkgver}/poi_${pkgver}_amd64.deb"
	"poi.sh")
sha256sums=('ba58432749f51fc4fdfe918fc4e129eb5369fe22afbdd78dd262dbe486787a9f'
            '2e3837fbe43bc5154d34190f9c10bd39b860a3a0cf6eb49c04c66701d9980b94')

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir/"
	chmod 4755 "${pkgdir}/opt/${_pkgname}/chrome-sandbox"
	install -Dm755 "poi.sh" "${pkgdir}/usr/bin/poi"
}
