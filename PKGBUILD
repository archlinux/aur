# Maintainer: Tomasz Jakub Rup <tomasz.rup@gmail.com>
pkgname=openapi-generator-cli
pkgver=3.3.4
pkgrel=1
pkgdesc="OpenAPI Generator CLI + bash completion"
arch=('any')
url="https://openapi-generator.tech/"
license=('Apache')
source=("http://central.maven.org/maven2/org/openapitools/$pkgname/$pkgver/$pkgname-$pkgver.jar"
        "https://raw.githubusercontent.com/OpenAPITools/openapi-generator/v$pkgver/scripts/openapi-generator-cli-completion.bash"
        "openapi-generator-cli")
noextract=("$pkgname-$pkgver.jar")
md5sums=('2733cbe4f1e81745f616738320e24f70'
         '64934ddd97afb1b86640ed77f5683a93'
         '9c6bf97fc32c0b8e289068d81cf96b33')

package() {
	depends=('java-runtime' 'bash')

	install -Dm755 openapi-generator-cli "$pkgdir/usr/bin/openapi-generator-cli"
	install -Dm644 openapi-generator-cli-completion.bash "$pkgdir/etc/bash_completion.d/openapi-generator-cli"
	install -Dm644 $pkgname-$pkgver.jar "$pkgdir/usr/share/java/$pkgname-$pkgver.jar"

        sed -i -e "s/\$pkgname/$pkgname/g" "$pkgdir/usr/bin/openapi-generator-cli"
        sed -i -e "s/\$pkgver/$pkgver/g" "$pkgdir/usr/bin/openapi-generator-cli"
}
