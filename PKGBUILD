# Maintainer : Florent H. CARRÉ <colundrum@gmail.com>

pkgname=skippy-xd-git
pkgver=0
pkgrel=1
pkgdesc="A full-screen task-switcher for X11, similar to Apple's Expose."
url="http://code.google.com/p/skippy-xd/"
license=('GPL')
depends=('libxinerama' 'libxcomposite' 'libxdamage' 'libxft' 'xorg-server' 'giflib')
makedepends=('git')
arch=('i686' 'x86_64')
source=("git://github.com/richardgv/skippy-xd.git")
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

# see also https://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
pkgver() {
	cd "$srcdir/skippy-xd"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "$srcdir/skippy-xd"
	make
}

package() {
	cd "$srcdir/skippy-xd"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
