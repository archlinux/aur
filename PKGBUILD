# Maintainer: Brad Kennedy <bk@co60.ca>
pkgname=bunnysay-git 
pkgver=v1.1.r0.248f58e
pkgrel=1
pkgdesc='Fullwidth bunny signs for terminal and Twitter/webforms'
arch=('i686' 'x86_64')
url='https://github.com/co60ca/bunnysay'
license=('GPL3')
groups=()
depends=()
makedepends=('git') 
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/co60ca/bunnysay.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "bunnysay"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "bunnysay"
	make
}

package() {
	cd "bunnysay"
	mkdir -p "$pkgdir/usr/bin"
	make prefix="$pkgdir/usr" install
	install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
