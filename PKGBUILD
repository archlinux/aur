# Maintainer: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=java-debug
pkgver=0.53.1
pkgrel=2
pkgdesc="The debug server implementation for Java."
arch=(any)
url="https://github.com/microsoft/java-debug"
license=('EPL-1.0')
depends=('java-runtime>=17')

source=(
	"https://repo1.maven.org/maven2/com/microsoft/java/com.microsoft.java.debug.core/${pkgver}/com.microsoft.java.debug.core-${pkgver}.jar"
	"https://repo1.maven.org/maven2/com/microsoft/java/com.microsoft.java.debug.plugin/${pkgver}/com.microsoft.java.debug.plugin-${pkgver}.jar"
	"https://raw.githubusercontent.com/microsoft/java-debug/refs/heads/main/LICENSE.txt"
)

sha256sums=(
	'50c58683cc97e91e95d73a6160df0316f3a1832045d33e7ea93fdf852a65fb38'
    '4f4778d452a6a0665536f43ce4e32403a24be6593336b80dc85a322912859e24'
    'f494326c16bc95ebb14874ea5fa2c16a963eb36d1f2ab6fe99490073709771c1'
)

noextract=(
	"com.microsoft.java.debug.core-${pkgver}.jar"
	"com.microsoft.java.debug.plugin-${pkgver}.jar"
)

package() {

	cd $srcdir

	install -Dm755 "com.microsoft.java.debug.plugin-${pkgver}.jar" \
		"$pkgdir/usr/share/java-debug/com.microsoft.java.debug.plugin.jar"

	install -Dm755 "com.microsoft.java.debug.core-${pkgver}.jar" \
		"$pkgdir/usr/share/java-debug/com.microsoft.java.debug.core.jar"

	install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
