# Maintainer: Dmitry Lyashuk <lyashuk.voxx at gmail dot com>
pkgname=modern-theme
pkgver=1.31
pkgrel=1
pkgdesc="GTK3/GTK4 theme powered by Adwaita technologies, contains color schemes for Qt5/Qt6/KDE and Aurorae theme"
arch=(any)
url="https://github.com/TerminalHash/Modern"
license=('GPL3')
conflicts=(modern-theme-git)
source=('https://github.com/TerminalHash/Modern/releases/download/v1.31/modern-v1.31.tar.bz2')
md5sums=('b75c121b51a8bdbab4a63ab9ac256e8e')

package() {
	mkdir -p $pkgdir/usr/share/aurorae/themes
	mkdir -p $pkgdir/usr/share/themes
	mkdir -p $pkgdir/usr/share/color-schemes
	mkdir -p $pkgdir/usr/share/qt5ct/colors
	mkdir -p $pkgdir/usr/share/qt6ct/colors

	# Main process
	mv Dark $pkgdir/usr/share/themes/Modern-Dark
	mv White $pkgdir/usr/share/themes/Modern-White

	# KDE Plasma
    cd KWin
    mv Modern $pkgdir/usr/share/aurorae/themes

    cd '../Color schemes'
    cd KDE
    cp Plume.colors $pkgdir/usr/share/color-schemes

    # Common color schemes for Qt
    cd '../Qt Configurator'
    cp * $pkgdir/usr/share/qt5ct/colors
    cp * $pkgdir/usr/share/qt6ct/colors

	find $pkgdir/usr/ -type f -exec chmod 644 {} \;
	find $pkgdir/usr/ -type d -exec chmod 755 {} \;
}
