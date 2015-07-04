pkgname=surf2
pkgrel=1
pkgver=a06af0f
pkgdesc='A suckless web browser for webkit2gtk'
arch=('i686' 'x86_64')
url='http://surf.suckless.org/'
license=('MIT')
depends=('webkit2gtk' 'xorg-xprop' 'libbsd')
optdepends=('dmenu: URL-bar'
'ca-certificates: SSL verification'
'curl: default download handler')
makedepends=('pkgconfig')
source=('surf2::git+http://git.suckless.org/surf#branch=surf2')
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --always
}

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
