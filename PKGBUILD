# Maintainer: esrh : email at esrh.me/pages/contact.html
pkgname=ames
pkgver=v0.1.4.r3.gf0e1fca
pkgrel=1
pkgdesc="Update anki cards with desktop audio and images"
arch=('any')
url="https://github.com/eshrh/ames"
license=('GPL3')
depends=('pulseaudio' 'ffmpeg' 'maim' 'xdotool' 'libnotify' 'xsel')
source=("git+https://github.com/eshrh/ames")
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

