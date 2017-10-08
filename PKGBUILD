# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=lalinference
pkgver=1.9.4
pkgrel=1
pkgdesc="The LIGO Scientific Consortium Algorithm Library Suite. lalinference"
arch=(any)
url="https://wiki.ligo.org/DASWG/LALSuiteInstall"
license=('unknown')
groups=('lalsuite')
depends=('lalcore' 'lalmetaio' 'hdf5' 'lalframe' 'lalsimulation' 'lalinspiral' 'lalpulsar' 'lalburst')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://software.ligo.org/lscsoft/source/lalsuite/${pkgname}-${pkgver}.tar.xz")
sha256sums=('73e9ee32507da91f176db790dc12b9a3d16a769ca3047af7c4fa279eaf915e31')
package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    sed -i 's/\-Werror//g' configure
    ./configure --prefix=$pkgdir/usr
    make -j
    make install
}
