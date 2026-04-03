# Maintainer: copygirl <copygirl@mcft.net>
_pkgname=cubyz

pkgname=cubyz-bin
pkgver=0.2.0
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
sha256sums_x86_64=("08fea2b9a09734e17e633a10e06da4bc6a2f9d3bed888758007b16280d8d13d8")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::$url/releases/download/$pkgver/Linux-aarch64.tar.gz")
sha256sums_aarch64=("b1e367e037bc38da4598daaa068eaa6815c78209310124e1f867560d288c0299")

package() {
	# Copy application icon, .desktop file and launcher script
	install -Dm644 Cubyz/assets/cubyz/logo.png "$pkgdir"/usr/share/pixmaps/"$_pkgname".png
	install -Dm644 "$_pkgname".desktop "$pkgdir"/usr/share/applications/"$_pkgname".desktop
	install -Dm755 "$_pkgname".sh "$pkgdir"/usr/bin/"$_pkgname"

	# Copy application files
	install -dm 755 "$pkgdir"/opt # Create directory first (required)
	cp -r --preserve=mode "Cubyz" "$pkgdir"/opt/"$_pkgname"
}
