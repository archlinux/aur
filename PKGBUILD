# Maintainer: copygirl <copygirl@mcft.net>
_pkgname=cubyz

pkgname=cubyz-bin
pkgver=0.1.1
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
source_x86_64=("$url/releases/download/$pkgver/Linux-x86_64.tar.gz")
sha256sums_x86_64=("d409e15f9596322f5f5e55472acc02f820564bdedf53d7d125da9ae1cb58f11b")
source_aarch64=("$url/releases/download/$pkgver/Linux-aarch64.tar.gz")
sha256sums_aarch64=("d316eea69402a5f9433879ab19a065a18225e84e5721635d3053bed6799bda55")

package() {
	# Copy application icon, .desktop file and launcher script
	install -Dm644 Cubyz/assets/cubyz/logo.png "$pkgdir"/usr/share/pixmaps/"$_pkgname".png
	install -Dm644 "$_pkgname".desktop "$pkgdir"/usr/share/applications/"$_pkgname".desktop
	install -Dm755 "$_pkgname".sh "$pkgdir"/usr/bin/"$_pkgname"

	# Copy application files
	install -dm 755 "$pkgdir"/opt # Create directory first (required)
	cp -r --preserve=mode "Cubyz" "$pkgdir"/opt/"$_pkgname"
}
