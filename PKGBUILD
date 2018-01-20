# Maintainer: copygirl <copygirl@mcft.net>
pkgname=vintagestory
pkgver=1.4.9.3
pkgrel=1
pkgdesc="Vintage Story"
arch=("any")
url="https://www.vintagestory.at/"
license=("custom")
depends=("mono")
options=()
source=("https://account.vintagestory.at/files/stable/vs_archive_${pkgver}.tar.gz"
        "vintagestory.desktop"
        "vintagestory.sh")
md5sums=("8be0852270204b769178e9c8b0377d97"
         "7cf82f218ba3026aff620b131b7dc581"
         "da232b56f48e047ec60791bb7d8b6398")

package() {
	# Create directory structure
	install -dm 755 ${pkgdir}/usr/{bin,share/{,pixmaps,applications}}
	# Copy console launcher .sh
	install -Dm 755 ${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
	# Copy application icon and .desktop launcher file
	install -Dm 644 ${pkgname}/assets/gameicon.xpm ${pkgdir}/usr/share/pixmaps/${pkgname}.xpm
	install -Dm 644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/
	# Move application files
	mv ${pkgname} ${pkgdir}/usr/share/${pkgname}
}
