# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=lalcore
pkgver=6.18.0
pkgrel=3
pkgdesc="The LIGO Scientific Consortium Algorithm Library Suite. lalcore"
arch=(any)
url="https://wiki.ligo.org/DASWG/LALSuiteInstall"
license=('unknown')
groups=('lalsuite')
depends=('gsl' 'hdf5')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://software.ligo.org/lscsoft/source/lalsuite/lal-${pkgver}.tar.xz")
sha256sums=('464601c529f5607c251a54843e749bc9bd962055cc04ba21fdf6150e392a0ba2')
package() {
    cd "$srcdir/lal-${pkgver}"
    sed -i 's/\-Werror//g' configure
    ./configure --prefix=$pkgdir/usr
    make -j
    make install
}
