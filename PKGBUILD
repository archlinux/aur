# Maintainer: copygirl <copygirl@mcft.net>
_pkgname=cubyz

pkgname=cubyz-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Open source voxel sandbox game"
arch=("x86_64" "aarch64")
url="https://github.com/PixelGuys/Cubyz"
license=("GPL-3.0")
depends=() # Unsure what to even put here
source=("$_pkgname.desktop"
        "$_pkgname.sh")
md5sums=("c2ef0d9256c5213e3a8d3a28117f65bd"
         "945afd003b39ee45a36ad50b2e9ca9e5")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::$url/releases/download/$pkgver/Linux-x86_64.tar.gz")
sha256sums_x86_64=("bbf6a96e8cb2e36ad7a479065b84b5dee1cb8e8f46b9916433af2448a9d15876")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::$url/releases/download/$pkgver/Linux-aarch64.tar.gz")
sha256sums_aarch64=("d38703fc4b1f1e0415b080a76a6d3200a2e4f30a4cce581e52557b8cd712c661")

package() {
	# Copy application icon, .desktop file and launcher script
	install -Dm644 Cubyz/assets/cubyz/logo.png "$pkgdir"/usr/share/pixmaps/"$_pkgname".png
	install -Dm644 "$_pkgname".desktop "$pkgdir"/usr/share/applications/"$_pkgname".desktop
	install -Dm755 "$_pkgname".sh "$pkgdir"/usr/bin/"$_pkgname"

	# Copy application files
	install -dm 755 "$pkgdir"/opt # Create directory first (required)
	cp -r --preserve=mode "Cubyz" "$pkgdir"/opt/"$_pkgname"
}
