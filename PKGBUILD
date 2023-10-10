# Maintainer: TeSSLa Community <info@tessla.io>
pkgname=tessla
pkgver=2.0.0
pkgrel=1
pkgdesc="TeSSLa toolchain bundle"
arch=(any)
url=https://tessla.io
depends=('java-runtime>=11')
optdepends=()
makedepends=()
license=(Apache)
noextract=("tessla-${pkgver}.jar")
# "tessla-${pkgver}.jar"::"https://git.tessla.io/tessla/tessla/builds/artifacts/master/raw/target/scala-3.2.2/tessla-assembly-${pkgver}.jar?job=deploy"
source=(
	"tessla-${pkgver}.jar"::"https://git.tessla.io/tessla/tessla/builds/1520/artifacts/raw/target/scala-3.2.2/tessla-assembly-${pkgver}.jar"
	"tessla")
sha256sums=(
	'1f8f4b5406a2843e38655fad95ed1bfec5de1aacb46d0dbdb5f92088cc001ad3'
	'2d9931705d32832b11aaee1ed212f53bc62da1266ddd7db010e63861eb3c55c1')

package() {
	# Install tessla.jar in /usr/share/java/
	install -Dm 644 "${srcdir}/tessla-${pkgver}.jar" "${pkgdir}/usr/share/java/tessla.jar"
	# Install runner script in /usr/bin/
	install -Dm 755 "${srcdir}/tessla" "${pkgdir}/usr/bin/tessla"
}
