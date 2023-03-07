# Maintainer: Dmitry Lyashuk <lyashuk.voxx at gmail dot com>
pkgname=modern-theme
pkgver=1.1a
pkgrel=1
pkgdesc="Small tweaks of standart Adwaita/adw-mod theme, contains color schemes for Qt5/Qt6/KDE"
arch=(any)
url="https://github.com/TerminalHash/Modern"
license=('GPL3')
conflicts=(modern-theme-git)
source=('https://github.com/TerminalHash/Modern/releases/download/v1.1a/modern-v1.1a.tar.bz2')
md5sums=('07a7ec2d112ee9938dfaf21305605204')

package() {
	mkdir -p $pkgdir/usr/share/themes
	mkdir -p $pkgdir/usr/share/color-schemes
	mkdir -p $pkgdir/usr/share/qt5ct/colors
	mkdir -p $pkgdir/usr/share/qt6ct/colors
	
	# Copy openbox theme
	cd 'WM Themes'
	cp -r openbox-3 ../Dark
	cp -r openbox-3 ../White
	cd ..
	
	# Main process
	mv Dark $pkgdir/usr/share/themes/Modern-Dark
	mv White $pkgdir/usr/share/themes/Modern-White
    
    cd 'Color schemes'
    cd KDE
    cp Plume.colors $pkgdir/usr/share/color-schemes
    cd '../Qt Configurator'
    cp * $pkgdir/usr/share/qt5ct/colors
    cp * $pkgdir/usr/share/qt6ct/colors

	find $pkgdir/usr/ -type f -exec chmod 644 {} \;
	find $pkgdir/usr/ -type d -exec chmod 755 {} \;
}
