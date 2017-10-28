# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: Eric Mandel 
pkgname=funtools-git
pkgver=r50.9c8bb6f
pkgrel=1
#epoch=

pkgdesc=" FITS library and utility package.  "


arch=('x86_64')
url="https://github.com/ericmandel/funtools"
license=('GPL3')
groups=()
depends=('sh')
makedepends=('git')
checkdepends=()
optdepends=()
#provides=()
#conflicts=()
#replaces=()
#backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver::git+${url}")
#noextract=()
md5sums=('SKIP')
#validpgpkeys=()


build() {
	cd "$src"	
	cd "$pkgname-$pkgver"
	./mkconfigure
	./configure --prefix=/usr 
	make
}


pkgver() {
  cd "$pkgname-$pkgver"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
	cd "$src"
	cd "$pkgname-$pkgver"
	install -d "$pkgdir"/usr/share/man
	make DESTDIR="$pkgdir" install

}
