# Maintainier: FadeMind <fademind@gmail.com>
# Contributor: Tommaso Sardelli <lacapannadelloziotom [at] gmail [dot] com>

pkgname=caledonia-bundle-plasma5
pkgver=2.0
pkgrel=2
pkgdesc="A bundle with all Caledonia customizations for Plasma 5"
arch=('any')
url=('http://caledonia.sourceforge.net/')
license=('CCPL:by-sa')
depends=('plasma-workspace')
source=("Caledonia-${pkgver}.tar.gz::http://sourceforge.net/projects/caledonia/files/Caledonia%20%28Plasma-KDE%20Theme%29/Caledonia-${pkgver}.tar.gz"
        "Caledonia-KSplash-${pkgver}.tar.gz::http://sourceforge.net/projects/caledonia/files/Caledonia%20KSplash/Caledonia-KSplash-${pkgver}.tar.gz"
        "Caledonia.colors::http://sourceforge.net/projects/caledonia/files/Caledonia%20Color%20Scheme/Caledonia.colors"
        "Caledonia_Official_Wallpaper_Collection-${pkgver}.tar.gz::http://sourceforge.net/projects/caledonia/files/Caledonia%20Official%20Wallpapers/Caledonia_Official_Wallpaper_Collection-${pkgver}.tar.gz")
sha256sums=('3d855b7806d23ad3f748a30e9b0fa94c8ad7ec489fd19a4c026276b3045c5bcc'
            '6b44c2a77bf2e56b2b48f535b3c3678328dcf826d2a558d319357d5fbd3c2c72'
            '455dc9cfe3071f2ade5447ef5cf25b287e75d7c0b3c51b56ed737e10a5639fb0'
            '42caaeff55359bb5789f2c624595a4d67011024ec5201d40212f381b82535e29')

package() {
	mkdir -p -m755 "${pkgdir}/usr/share/ksplash/Themes" \
	               "${pkgdir}/usr/share/plasma/desktoptheme" \
	               "${pkgdir}/usr/share/color-schemes" \
	               "${pkgdir}/usr/share/wallpapers"
	cp -r --no-preserve=mode Caledonia-KSplash "${pkgdir}/usr/share/ksplash/Themes"
	cp -rf --no-preserve=mode Caledonia        "${pkgdir}/usr/share/plasma/desktoptheme"
	cp --no-preserve=mode Caledonia.colors     "${pkgdir}/usr/share/color-schemes"

	cd Caledonia_Official_Wallpaper_Collection
	rm README
	cp -rf --no-preserve=mode * "${pkgdir}/usr/share/wallpapers"
} 
