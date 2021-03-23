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
b2sums=(
	"SKIP"
	"74ae9113cbe5daa8f293697e722ce13e98042cb675dd6d62e13f45990ae49afdad8b2b5433f52b8b9e091d96172754f7b8160ac535ce57b022c26c0a138bf60b"
	"157b2c36f8bdd81d0c46bea1c0009ea314c61caaf637f6b325710f5c96ad808ed11f6dd9775b5540532b948faa0d0d7fbf9fe3fd86c3fc4b9cceecc543591ba6"	
	"77d704abc716bbbe0ed1c10fbccbce0ae40bbcc4a90ebb00122712c2517933f318a6fcab30584df2cb08540eada45f43cf1b12bebc6f3009b184c5238a25d857"
)

pkgver()
{
	curl -sLI "$url" | grep -Fi "content-disposition" | grep -Po "\d*[.]\d.*\d"
}

package() {
	install -D -m 644 "TLauncher-$pkgver.jar" "$pkgdir/opt/tlauncher/launcher.jar"
	install -D -m 644 "tlauncher.desktop" "$pkgdir/usr/share/applications/tlauncher.desktop"
	install -D -m 755 "tlauncher.sh" "$pkgdir/usr/bin/tlauncher"
	install -D -m 644 "tlauncher.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/tlauncher.png"
}
