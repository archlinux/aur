pkgname=ttydisp-git
_pkgname=ttydisp
pkgver=0.0.2
pkgrel=1
pkgdesc="Play video in the terminal"
arch=('i686' 'x86_64')
license=('MIT')
depends=('ffmpeg' 'libvdpau')
makedepends=('cmake' 'git')
source=("git+https://github.com/jamesthoughton/ttydisp")
url='https://github.com/jamesthoughton/ttydisp'
sha256sums=('SKIP')

build() {
	cd "${_pkgname}"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "${_pkgname}"
	make DESTDIR="${pkgdir}" install
}
