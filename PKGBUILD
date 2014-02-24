pkgname=powerline-fonts
_gitname=powerline-fonts
pkgver=6001307
pkgrel=2
depends=('fontconfig' 'xorg-font-utils')
makedepends=('git')
url=('https://github.com/Lokaltog/powerline-fonts')
license='CPL'
pkgdesc="Patched fonts for Powerline users"
arch=('any')
source=('git://github.com/Lokaltog/powerline-fonts.git' 'Monaco_Linux-Powerline.ttf')
install=$pkgname.install

md5sums=('SKIP'
         '0ee621b836e612113cf497d810301e2f')

pkgver() {
	cd $_gitname
	# Use the tag of the last commit
	git describe --always | sed 's|-|.|g'
}

package() {
	install -d "$pkgdir/usr/share/fonts/TTF"
	cd $_gitname
	cp "$srcdir/Monaco_Linux-Powerline.ttf" "$pkgdir/usr/share/fonts/TTF/"
	cp -dpr --no-preserve=ownership */*.ttf "$pkgdir/usr/share/fonts/TTF/"
}

