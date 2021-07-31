# Maintainer: Nanozuki <pt.wenhan@gmail.com>

pkgname=infra-appimage
pkgver=0.46.0
pkgrel=1
pkgdesc="Infra App for Linux"
arch=('i686' 'x86_64')
url="https://infra.app"
license=('custom')
groups=('')
depends=()
optdepends=()
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=(
	'https://download.infra.app/linux/infra_latest_amd64.deb'
	'https://download.infra.app/linux/infra-latest.AppImage'
)
sha512sums=(
	'6c7c1fa0335b786ba069da70696fa673420d620e603cfc055177fe7979a80710dd200e15e8c4f361152e7957fa56fe6c0fa31089a892fc4dd1c8a2dac4bc7972'
	'0d0f0a71f5acc6cd6c232f5500a220db7672e8621ac96777afe6d30ec07656f0ebeea96cf824dc021d652d6c8834a06571d2036fa93b4963ee8a6a5f5f510a7f'
)

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
	rm -f "${pkgdir}/usr/bin/infra"
	install -D -m755 "infra-latest.AppImage" "${pkgdir}/usr/bin/infra"
	install -D -m644 "${pkgdir}/usr/lib/infra/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "${pkgdir}/usr/share/doc/infra/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
	rm -rf "${pkgdir}/usr/lib"
}
