# Maintainer: copygirl <copygirl@mcft.net>
_pkgname=cubyz

pkgname=cubyz-bin
pkgver=0.0.0
pkgrel=1
pkgdesc="Open source voxel sandbox game"
arch=("x86_64" "aarch64")
url="https://github.com/PixelGuys/Cubyz"
license=("GPL-3.0")
depends=() # Unsure what to even put here
source=("$_pkgname.desktop"
        "$_pkgname.sh")
md5sums=("c2ef0d9256c5213e3a8d3a28117f65bd"
         "48e04a2e9d4d1c09763113c64a651cdb")
source_x86_64=("$url/releases/download/$pkgver/Linux-x86_64.tar.gz")
sha256sums_x86_64=("3536af59401c26f2d949008ac73f2927c98f8f709a773afa12a3bc378b1486d9")
source_aarch64=("$url/releases/download/$pkgver/Linux-aarch64.tar.gz")
sha256sums_aarch64=("4266f43fae61d11061435bcd1142523cfe017a75953915fc981eceb08dc69411")

package() {
	# Copy application icon, .desktop file and launcher script
	install -Dm644 Cubyz/assets/cubyz/logo.png "$pkgdir"/usr/share/pixmaps/"$_pkgname".png
	install -Dm644 "$_pkgname".desktop "$pkgdir"/usr/share/applications/"$_pkgname".desktop
	install -Dm755 "$_pkgname".sh "$pkgdir"/usr/bin/"$_pkgname"

	# Copy application files
	install -dm 755 "$pkgdir"/opt # Create directory first (required)
	cp -r --preserve=mode "Cubyz" "$pkgdir"/opt/"$_pkgname"
}
