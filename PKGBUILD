# Maintainer: Kevin D'souza krypticallusion@gmail.com
# Contributor: Diab Neiroukh <lazerl0rd at thezest dot dev>

pkgname="tlauncherorg"
pkgver="2.75"
pkgrel=2
epoch=1
arch=("any")
pkgdesc="Builds of the TLauncher freeware launcher for Minecraft from tlauncher.org."
url="https://tlauncher.org"
license=("GPL3")
depends=(
	"java-runtime>=8"
)
source=(
	"launcher.zip::$url/jar"
	"tlauncher.desktop"
	"tlauncher.svg"
	"tlauncher.sh"
)
sha256sums=(
	"SKIP"
	"444e8fb36c85d1dc95b115f18b06a58254e27f08ed4b0e75727e72d411a3bfb2"
	"993b28b7258736b0d1737690f407498f9d4fa302661b9781d017eb1dabec4319"	
	"457df57e50c5111cf6faa9d69a1f6cecfc258162a41423344a251cad27b1048f"
)

pkgver()
{
	curl -sLI "$url/jar" | grep -Fi "content-disposition" | grep -Po "\d*[.]\d.*\d"
}

package() {
	install -D -m 644 "TLauncher-$pkgver.jar" "$pkgdir/opt/tlauncher/launcher.jar"
	install -D -m 644 "tlauncher.desktop" "$pkgdir/usr/share/applications/tlauncher.desktop"
	install -D -m 755 "tlauncher.sh" "$pkgdir/usr/bin/tlauncher"
	install -D -m 644 "tlauncher.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/tlauncher.png"
}
