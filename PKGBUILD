# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=lalsimulation
pkgver=1.7.3
pkgrel=2
pkgdesc="The LIGO Scientific Consortium Algorithm Library Suite. lalsimulation"
arch=(any)
url="https://wiki.ligo.org/DASWG/LALSuiteInstall"
license=('unknown')
groups=('lalsuite')
depends=('lalcore')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://software.ligo.org/lscsoft/source/lalsuite/${pkgname}-${pkgver}.tar.xz")
sha256sums=('84ea0c91daca9fac547b2d3344140c809d940f593b678265b616e7e0d6fc5d07')
package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    sed -i 's/\-Werror//g' configure
    ./configure --prefix=$pkgdir/usr
    make -j
    make install
}
