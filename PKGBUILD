# Maintainer: Solomon Choina <shlomochoina at gmail dot com>
pkgname=('yaru-colors-gtk-theme'
         'yaru-colors-icon-theme'
         'yaru-colors-wallpapers')
pkgbase='yaru-colors-gtk-theme'
pkgver=21.04
pkgrel=1
pkgdesc="A fork of Ubuntu's Yaru theme - in different colors"
arch=('any')
license=('GPL3')
url="https://github.com/Jannomag/Yaru-Colors"
makedepends=('git')
options=('!strip')
source=(https://github.com/Jannomag/Yaru-Colors/releases/download/${pkgver}snap/Yaru-Colors_${pkgver}.zip)
sha256sums=('e36f7830b5f8051f5776a42baf6d7138d41219eda7a5f3f95012457ee1ad3ba7')

package_yaru-colors-gtk-theme() {
	depends=('gtk3' 'gnome-themes-extra')
	optdepends=('gdk-pixbuf2: GTK2 support'
	            'gtk-engine-murrine: GTK2 support'
	            'yaru-colors-wallpapers: Matching wallpapers'
	            'yaru-colors-icon-theme: Matching icon theme'
	            'yaru-sound-theme: Matching sound theme')
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")

	cd "$srcdir"
	install -d "$pkgdir/usr/share/themes"
	cp -a Themes/* "$pkgdir/usr/share/themes"
}

package_yaru-colors-icon-theme() {
	depends=('yaru-icon-theme')
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")

	cd "$srcdir"
	install -d "$pkgdir/usr/share/icons"
	cp -a Icons/* "$pkgdir/usr/share/icons"
}

package_yaru-colors-wallpapers() {
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")

	cd "$srcdir"
	install -d "$pkgdir/usr/share/backgrounds/yaru-colors"
	cp -a Wallpapers/* "$pkgdir/usr/share/backgrounds/yaru-colors"
}
