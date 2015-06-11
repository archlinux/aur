# Maintainer: Andy Pieters <Andy@AndyPieters.me.uk>
pkgname=paswitch
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="Switch PulseAudio sink for all applications from the commandline."
arch=(x86_64 i686 )
url="http://www.tablix.org/~avian/blog/archives/2012/06/switching_pulseaudio_output_device/"
license=('gpl')
groups=()
depends=(libpulse)
makedepends=(git)
checkdepends=()
optdepends=()
provides=(paswitch)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=($pkgname-$pkgver::git+http://www.tablix.org/~avian/git/paswitch.git)

md5sums=('SKIP') #generate with 'makepkg -g'


build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -D paswitch $pkgdir/usr/bin/paswitch
}
