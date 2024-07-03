# Maintainer: TeSSLa Community <info@tessla.io>
pkgname=tessla
pkgver=2.1.0
pkgrel=1
pkgdesc="TeSSLa toolchain bundle"
arch=(any)
url=https://tessla.io
depends=('java-runtime>=11')
optdepends=()
makedepends=()
license=(Apache)
noextract=("tessla-${pkgver}.jar")
source=(
	"tessla-${pkgver}.jar"::"https://git.tessla.io/tessla/tessla/builds/artifacts/master/raw/target/scala-3.3.1/tessla-assembly-${pkgver}.jar?job=deploy"
	"tessla")
sha256sums=(
	'588ca616fed051bc5ba1e35a81b3a9f2ba3d2bf553d456bb794de01dfa901e22'
	'2d9931705d32832b11aaee1ed212f53bc62da1266ddd7db010e63861eb3c55c1')

package() {
	# Install tessla.jar in /usr/share/java/
	install -Dm 644 "${srcdir}/tessla-${pkgver}.jar" "${pkgdir}/usr/share/java/tessla.jar"
	# Install runner script in /usr/bin/
	install -Dm 755 "${srcdir}/tessla" "${pkgdir}/usr/bin/tessla"
}
