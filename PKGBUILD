# Maintainer: Dmitry Lyashuk <lyashuk.voxx at gmail dot com>
pkgname=modern-theme
pkgver=1.5
pkgrel=1
pkgdesc="GTK3/GTK4 theme powered by Adwaita technologies, contains some things for Qt/KDE/Kvantum also"
arch=(any)
url="https://github.com/TerminalHash/Modern"
license=('GPL3')
conflicts=(modern-theme-git)
source=('https://github.com/TerminalHash/Modern/releases/download/v1.31/modern-v1.31.tar.bz2')
md5sums=('0e7383d8cd537a505732a02416d68f08')

package() {
      mkdir -p $pkgdir/usr/share/aurorae/themes
      mkdir -p $pkgdir/usr/share/themes
      mkdir -p $pkgdir/usr/share/color-schemes
      mkdir -p $pkgdir/usr/share/qt5ct/colors
      mkdir -p $pkgdir/usr/share/qt6ct/colors
      mkdir -p $pkgdir/usr/share/Kvantum

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

    # Kvantum
      cd '../../Kvantum'
		mv ModernKv $pkgdir/usr/share/Kvantum

	find $pkgdir/usr/ -type f -exec chmod 644 {} \;
	find $pkgdir/usr/ -type d -exec chmod 755 {} \;
}
