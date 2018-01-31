# Maintainer: copygirl <copygirl@mcft.net>
pkgname=vintagestory
pkgver=1.5.0.1
pkgrel=1
pkgdesc="An in-development indie sandbox game about innovation and exploration"
arch=("any")
url="https://www.vintagestory.at/"
license=("custom")
depends=("mono")
options=()
source=("https://account.vintagestory.at/files/stable/vs_archive_${pkgver}.tar.gz"
        "vintagestory.desktop"
        "vintagestory.sh")
md5sums=("5399bbb72ef2cc35414ae78f1b5c0c61"
         "7cf82f218ba3026aff620b131b7dc581"
         "da232b56f48e047ec60791bb7d8b6398")

package() {
	# Create directory structure
	install -dm 755 ${pkgdir}/usr/{bin,share/{,pixmaps,applications,fonts/TTF}}
	# Copy console launcher .sh
	install -Dm 755 ${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
	# Copy application icon and .desktop launcher file
	install -Dm 644 ${pkgname}/assets/gameicon.xpm ${pkgdir}/usr/share/pixmaps/${pkgname}.xpm
	install -Dm 644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/
	# Copy fonts
	install -Dm 644 ${pkgname}/assets/fonts/*.ttf ${pkgdir}/usr/share/fonts/TTF/
	# Move application files
	mv ${pkgname} ${pkgdir}/usr/share/${pkgname}
}
