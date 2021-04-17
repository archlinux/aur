# Maintainer: ROllerozxa (temporaryemail4meh [gee mail])
pkgname=mcaselector
pkgver=1.15.3
pkgrel=1
pkgdesc="An external tool to export or delete selected chunks and regions from a world save of Minecraft Java Edition."
arch=(any)
url="https://github.com/Querz/mcaselector"
license=('MIT')
depends=('java-runtime' 'bash')
source=("mcaselector.jar::https://github.com/Querz/mcaselector/releases/download/${pkgver}/mcaselector-${pkgver}.jar"
		"mcaselector.desktop"
		"mcaselector.png"
		"mcaselector")
sha256sums=('c20ef8c1727a37b669b2b177a356ae6c0d33aad3108e9defd97d51bfb0bafe87'
            '9f97cb7dbdfe2a5871223e7b529d0a621ac342120b53120eaf9d55c5ef9b5b4d'
            'c8aa867604c6eb3e31649cfec02d914aa0ab6cd30080cb7a4aecbecef2254837'
            'd7a40a819301cf764e6237f2c0a5727047fb3de4bf52841d3ff392c686621482')
noextract=("mcaselector.jar")
options=(!strip)

package() {
	install -Dm755 "${srcdir}/mcaselector" "${pkgdir}/usr/bin/mcaselector"
	install -Dm755 "${srcdir}/mcaselector.jar" "${pkgdir}/usr/share/java/mcaselector.jar"
	install -Dm644 "${srcdir}/mcaselector.desktop" "${pkgdir}/usr/share/applications/mcaselector.desktop"
	install -Dm644 "${srcdir}/mcaselector.png" "${pkgdir}/usr/share/pixmaps/mcaselector.png"
}
