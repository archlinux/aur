# Maintainer: Dracomage <dracomage at disroot dot org>
# Contributor: ROllerozxa <temporaryemail4meh [gee mail]>
# Contributor: sem.z <sem.z@protonmail.com>
# Contributor: soulsuke <6tsukiyami9@gmail.com>

pkgname=mcaselector
pkgver=2.5.3
pkgrel=1
pkgdesc="An external tool to export or delete selected chunks and regions from a world save of Minecraft Java Edition."
arch=(any)
url="https://github.com/Querz/mcaselector"
license=('MIT')
depends=('java-runtime-openjdk>=21' 'java-openjfx>=21' 'bash')
source=("mcaselector-${pkgver}.jar::https://github.com/Querz/mcaselector/releases/download/${pkgver}/mcaselector-${pkgver}.jar"
		"mcaselector.desktop"
		"mcaselector.png"
		"mcaselector")
sha256sums=('3d0097c2d10af93ab5711243933950e37761750dc9f9b77cc7fca6bec7c87dd0'
            '9f97cb7dbdfe2a5871223e7b529d0a621ac342120b53120eaf9d55c5ef9b5b4d'
            '8d572c0109cce3f4f4477fa964ff05908fa80536bef3099be783200e04e13931'
            '6637f93b8bfa69be65a0d9ae4efdbd09de3dae25742c24ec3d6126cf4847909a')
noextract=("mcaselector-${pkgver}.jar")
options=(!strip)

package() {
	install -Dm755 "${srcdir}/mcaselector" "${pkgdir}/usr/bin/mcaselector"
	install -Dm755 "${srcdir}/mcaselector-${pkgver}.jar" "${pkgdir}/usr/share/java/mcaselector.jar"
	install -Dm644 "${srcdir}/mcaselector.desktop" "${pkgdir}/usr/share/applications/mcaselector.desktop"
	install -Dm644 "${srcdir}/mcaselector.png" "${pkgdir}/usr/share/pixmaps/mcaselector.png"
}
