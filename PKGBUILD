# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
# Contributor: sem.z <sem.z@protonmail.com>
# Contributor: soulsuke <6tsukiyami9@gmail.com>
pkgname=mcaselector
pkgver=2.2.2
pkgrel=1
pkgdesc="An external tool to export or delete selected chunks and regions from a world save of Minecraft Java Edition."
arch=(any)
url="https://github.com/Querz/mcaselector"
license=('MIT')
depends=('java-runtime-openjdk>=16' 'java-openjfx' 'bash')
source=("mcaselector-${pkgver}.jar::https://github.com/Querz/mcaselector/releases/download/${pkgver}/mcaselector-${pkgver}.jar"
		"mcaselector.desktop"
		"mcaselector.png"
		"mcaselector")
sha256sums=('b4e49dccb171bc427d2d7962c1fa2c32481cad02ecad6eea0d2f2fae03f34282'
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
