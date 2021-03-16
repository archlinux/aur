# Maintainer: esrh : email at esrh at netc dot eu
pkgname=ames
pkgver=v0.1.2
pkgrel=1
pkgdesc="Update anki cards with desktop audio and images"
arch=('any')
url="https://github.com/eshrh/ames"
license=('GPL3')
depends=('pulseaudio' 'ffmpeg' 'maim' 'xdotool' 'libnotify')
source=("ames::git+https://github.com/Ajatt-Tools/ames")
md5sums=('SKIP')
install="ames.install"


pkgver() {
	cd "$pkgname"
	git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/$pkgname"
  	install -Dm755 ames.sh "$pkgdir"/usr/bin/ames
	install -Dm644 config "$pkgdir"/usr/share/ames/config
}

