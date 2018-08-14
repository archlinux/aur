# Maintainer: Tomasz Jakub Rup <tomasz.rup@gmail.com>
pkgname=openapi-generator-cli
pkgver=3.2.1
pkgrel=1
pkgdesc="OpenAPI Generator CLI + bash completion"
arch=('any')
url="https://openapi-generator.tech/"
license=('MIT')
depends=('java-runtime')
source=("http://central.maven.org/maven2/org/openapitools/$pkgname/$pkgver/$pkgname-$pkgver.jar"
"https://raw.githubusercontent.com/OpenAPITools/openapi-generator/v$pkgver/scripts/openapi-generator-cli-completion.bash"
"openapi-generator-cli")
noextract=("$pkgname-$pkgver.jar")
md5sums=('aad6df11441123df65c025037379f839'
'64934ddd97afb1b86640ed77f5683a93'
'f14e45b362f7c12de60d90c58178b2ad')

package() {
	install -Dm755 openapi-generator-cli "$pkgdir/usr/bin/openapi-generator-cli"
	install -Dm644 openapi-generator-cli-completion.bash "$pkgdir/etc/bash_completion.d/openapi-generator-cli"
	install -Dm644 $pkgname-$pkgver.jar "$pkgdir/usr/share/java/$pkgname-$pkgver.jar"
}
