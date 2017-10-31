# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: M. Jarvis
pkgname=python-ngmix
pkgver=r1087.3a0e7ce
pkgrel=1
#epoch=

pkgdesc=" Python interface to gbdes pixel map (astrometry) solutions "


arch=('x86_64')
url="https://github.com/esheldon/ngmix"
license=('GPL')
groups=()
depends=('python' 'python-numpy')
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
	python setup.py build
}


pkgver() {
  cd "$pkgname-$pkgver"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
	cd "$src"
	cd "$pkgname-$pkgver"
	python setup.py install --root=${pkgdir} --prefix=/usr

}
