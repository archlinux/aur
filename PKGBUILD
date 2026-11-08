# Maintainer: copygirl <copygirl@mcft.net>
_pkgname=cubyz

pkgname=cubyz-bin
pkgver=0.4.2
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
sha256sums_x86_64=("93abb55dd6e98410af1b1ff28d678d948dfeaba51c35cbc1a4231c00d03b9f98")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::$url/releases/download/$pkgver/Linux-aarch64.tar.gz")
sha256sums_aarch64=("d405b616cb2f42c218e36f2999f16d2eb976f7b4e9f83ab33935d35f94d55fe2")

package() {
	# Copy application icon, .desktop file and launcher script
	install -Dm644 Cubyz/assets/cubyz/logo.png "$pkgdir"/usr/share/pixmaps/"$_pkgname".png
	install -Dm644 "$_pkgname".desktop "$pkgdir"/usr/share/applications/"$_pkgname".desktop
	install -Dm755 "$_pkgname".sh "$pkgdir"/usr/bin/"$_pkgname"

	# Copy application files
	install -dm 755 "$pkgdir"/opt # Create directory first (required)
	cp -r --preserve=mode "Cubyz" "$pkgdir"/opt/"$_pkgname"
}
