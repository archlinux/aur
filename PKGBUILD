# Contributor: zenekron <zenekron@gmail.com>

_name=vscode-gradle
pkgname=gradle-language-server
pkgver=3.13.5
pkgrel=1
pkgdesc="Microsoft's Gradle language server"
url="https://github.com/microsoft/vscode-gradle"
arch=("any")
license=('custom:MIT')
depends=("java-runtime" "bash")
source=(${_name}-${pkgver}.tar.gz::"https://github.com/microsoft/vscode-gradle/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('ad0d5f0e0337f6a1305deb010f6724b4')


package() {
	cd ${_name}-${pkgver}
	install -d "$pkgdir/usr/share/java"
	cp -r "extension" "$pkgdir/usr/share/java/gradle-language-server"

	install -Dm 644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
