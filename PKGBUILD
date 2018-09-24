# Maintainer: Tomasz Jakub Rup <tomasz.rup@gmail.com>
pkgname=openapi-generator-cli
pkgver=3.2.3
pkgrel=2
pkgdesc="OpenAPI Generator CLI + bash completion"
arch=('any')
url="https://openapi-generator.tech/"
license=('Apache')
source=("http://central.maven.org/maven2/org/openapitools/$pkgname/$pkgver/$pkgname-$pkgver.jar"
"https://raw.githubusercontent.com/OpenAPITools/openapi-generator/v$pkgver/scripts/openapi-generator-cli-completion.bash"
"openapi-generator-cli")
noextract=("$pkgname-$pkgver.jar")
md5sums=('975f52f3e9d0f4591c7fef79c2f6f08b'
'64934ddd97afb1b86640ed77f5683a93'
'9c28e1d462511cb76dfafbb5fc00b606')

package() {
	depends=('java-runtime' 'bash')

	install -Dm755 openapi-generator-cli "$pkgdir/usr/bin/openapi-generator-cli"
	install -Dm644 openapi-generator-cli-completion.bash "$pkgdir/etc/bash_completion.d/openapi-generator-cli"
	install -Dm644 $pkgname-$pkgver.jar "$pkgdir/usr/share/java/$pkgname-$pkgver.jar"
}
