# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor:  GalSim developers team on GitHub
pkgname=python-galsim
pkgver=1.5.0
pkgrel=1
#epoch=

pkgdesc=" The modular galaxy image simulation toolkit "


arch=('x86_64')
url="https://github.com/GalSim-developers/GalSim/releases/tag/v1.5.0-alpha"
license=('unknown')
groups=()
depends=('python' 'scons' 'fftw' 'boost' 'tmv')
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
source=("https://github.com/GalSim-developers/GalSim/archive/v1.5.0-alpha.tar.gz")
#noextract=()
md5sums=('f74fd061510a1e507d6b9bc9f010e84c')
#validpgpkeys=()


build() {
	cd "$src"	
	cd "GalSim-$pkgver-alpha"
	scons PREFIX=/usr TMV_DIR=/usr
}


package() {
	cd "$src"
	cd "GalSim-$pkgver-alpha"
	scons PREFIX=$pkgdir/usr install

}
