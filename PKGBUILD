# Maintainer: Jeffrey Clark (h0tw1r3) <dude@zaplabs.com>

pkgname=attract
pkgver=1.6.2
pkgrel=1
pkgdesc="A graphical front-end for command line emulators that hides the underlying operating system and is intended to be controlled with a joystick or gamepad."
arch=('i686' 'x86_64')
url="http://www.attractmode.org/"
license=('GPL3')
depends=('sfml' 'openal' 'ffmpeg' 'fontconfig' 'libxinerama' 'libarchive')
provides=('attract')
conflicts=('attractmode-git')
source=("https://github.com/mickelson/${pkgname}/archive/v${pkgver}.tar.gz"
	"https://github.com/mickelson/${pkgname}/releases/download/v${pkgver}/ATTRACT.MODE.intro.16-9.v6.1080p.mp4")
sha1sums=(e3ed0a6cb1792b9dd7c857b604b11b5ecda7605a
	37885c5f2e6194e689c36eb88c43bd5bb23363d0)

build() {
	cd "${pkgname}-${pkgver}"
	VERSION="$pkgver" make prefix=/usr
}

package() {
	cd "${pkgname}-${pkgver}"
	make prefix="${pkgdir}/usr" install
	install -Dm644 ../ATTRACT.MODE.intro.16-9.v6.1080p.mp4 $pkgdir/usr/share/attract/intro/intro.mp4
}
