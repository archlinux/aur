# Maintainer: Manhong Dai <daimh@umich.edu>
pkgname=daisync-git
pkgver=r12.8770164
pkgrel=1
pkgdesc="an rsync-based time-machine backup tool"
arch=('any')
url="https://github.com/daimh/daisync"
license=('GPL')
groups=()
depends=(
	'coreutils'
	'util-linux'
	'rsync'
	'psmisc'
)
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=($pkgname::git+$url.git)
noextract=()
md5sums=('SKIP') #autofill using updpkgsums
package() {
	mkdir -p "$pkgdir/usr/bin" 
	install -Dm755 $pkgname/daisync* "$pkgdir/usr/bin/"
}
pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
