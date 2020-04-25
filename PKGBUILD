# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-polychord
pkgver='1.17.1'
pkgrel=1
pkgdesc="Next generation nested sampling (python library)"
arch=(any)
url="https://github.com/PolyChord/PolyChordLite"
groups=()
depends=('gcc-fortran' 'openmpi' 'polychord')
license=('custom')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://github.com/PolyChord/PolyChordLite/archive/${pkgver}.tar.gz")
sha256sums=('04ad8741776c1c53d4c7ed7ebe89f4d54e8f0bb8d9d221db8b4f8963384fe005')
package() {
    cd "${srcdir}/PolyChordLite-${pkgver}"
    sed -i 's:library_dirs.*:library_dirs=["/usr/lib/"],:' setup.py
    CC=mpicc CXX=mpicxx python setup.py install --root="$pkgdir/" --optimize=1 
}
