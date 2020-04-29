# Maintainer: Stephen Bell <theredbaron1834 @ yahoo.com>

pkgname=wagic-git
pkgver=0.22.2
pkgrel=2
pkgdesc='Wagic, the Homebrew, is a C++ game engine that allows to play card games against an AI, specificaly Magic the Gathering.'
url='https://github.com/WagicProject/wagic'
arch=('i686' 'x86_64')
license=('BSD')
makedepends=('git')
depends=('qt5-tools')
source=("Wagic.zip::https://github.com/WagicProject/wagic/releases/download/wagic-v0.22.2/WagicLinux-0222.zip"
		"icon.png::https://raw.githubusercontent.com/WagicProject/wagic/master/projects/mtg/Android/res/drawable-ldpi/icon.png"
		"wagic.desktop")
md5sums=('19e21d2152f7a2917f816ecc4e114b18' 'b7a81a97d072871a928aca72b7b70085'
		'9d56b11fba606cb633fd43661afde54f')

package() {
  	cd "$pkgdir"
  	install -m755 -d "$pkgdir/opt/Wagic"
  	install -m755 -d "$pkgdir/usr/share/icons"
  	install -m755 -d "$pkgdir/usr/share/applications/"
  
	cp -r "$srcdir/Wagic" "$pkgdir/opt/"
	cp -r -L "$srcdir/icon.png" "$pkgdir/usr/share/icons/wagic.png"
    cp $srcdir/wagic.desktop "$pkgdir/usr/share/applications/"
  	mkdir -p "$pkgdir/usr/share/applications/"
  	chmod +x "$pkgdir/opt/Wagic/Wagic"
  	chmod +x "$pkgdir/opt/Wagic/Wagic_X11" 	
  msg ""
  msg ""
  msg ""
  msg "If you want card icons, copy the image sets over to ~/.Wagic/sets/"
  msg ""
  msg ""
  msg ""
}
