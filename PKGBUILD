# Maintainer: SanskritFritz (gmail)

pkgname=xlode
pkgver=1
pkgrel=1
pkgdesc="A Lode Runner clone."
arch=('i686' 'x86_64')
url="https://github.com/hishamhm/xlode"
license=('GPL2')
depends=('sdl_mixer')
source=("https://github.com/hishamhm/xlode/archive/master.zip" "xlode.sh" "xlode.desktop")
md5sums=('62f353b104e3f8923489745d612e5fd0'
         'd49e991f6bb7325e1916f2bb1e7dc6fd'
         'b14cfee3437eea8f8a2559db693afadf')

build() {
	cd "xlode-master"
	make
}

package() {
	mkdir --parents "$pkgdir/usr/share/xlode"
	cp --preserve=all --recursive --no-target-directory "xlode-master" "$pkgdir/usr/share/xlode"
	install -Dm0755 "$srcdir/xlode.sh" "$pkgdir/usr/bin/xlode"
	install -Dm0644 "$srcdir/xlode.desktop" "$pkgdir/usr/share/applications/xlode.desktop"
}
