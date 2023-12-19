# Maintainer: NullBite <aur.archlinux@nullbite.com>
pkgname=packwiz-installer
pkgver=0.5.13
pkgrel=1
pkgdesc="An installer for packwiz modpacks."
arch=("any")
url="https://github.com/packwiz/packwiz-installer"
license=("MIT")
depends=('java-runtime')
_version_bootstrap=0.0.3
source=("packwiz-installer.jar::$url/releases/download/v$pkgver/packwiz-installer.jar"
"packwiz-installer-bootstrap.jar::$url-bootstrap/releases/download/v$_version_bootstrap/packwiz-installer-bootstrap.jar"
"packwiz-installer.sh")
sha256sums=('3cc3ebd57f1ec54a8ceaccc76e193201f8c957c563c9461253d112c5b087d744'
            'a8fbb24dc604278e97f4688e82d3d91a318b98efc08d5dbfcbcbcab6443d116c'
            '924aff17bf4ad5fd745c5378d39ec883f685a9b0f4f754828cd99bc83c71df6d')

package() {
	cd "$srcdir"
	install -Dm644 packwiz-installer.jar \
		"${pkgdir}/usr/share/java/packwiz/packwiz-installer.jar"

	install -Dm644 packwiz-installer-bootstrap.jar \
		"${pkgdir}/usr/share/java/packwiz/packwiz-installer-bootstrap.jar"

	install -Dm755 packwiz-installer.sh "${pkgdir}/usr/bin/packwiz-installer"
}
