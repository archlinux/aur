# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=lalframe
pkgver=1.4.3
pkgrel=2
pkgdesc="The LIGO Scientific Consortium Algorithm Library Suite. lalframe"
arch=(any)
url="https://wiki.ligo.org/DASWG/LALSuiteInstall"
license=('unknown')
groups=('lalsuite')
depends=('libframe' 'lalcore')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://software.ligo.org/lscsoft/source/lalsuite/${pkgname}-${pkgver}.tar.xz")
sha256sums=('cbb6ed39abb5a02d792523fc53208330cf8adf02bc4290cac635d42577acb5b1')
package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    sed -i 's/\-Werror//g' configure
    ./configure --prefix=$pkgdir/usr
    make -j
    make install
}
