# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=lalstochastic
pkgver=1.1.20
pkgrel=2
pkgdesc="The LIGO Scientific Consortium Algorithm Library Suite. lalstochastic"
arch=(any)
url="https://wiki.ligo.org/DASWG/LALSuiteInstall"
license=('unknown')
groups=('lalsuite')
depends=('lalcore' 'lalmetaio')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://software.ligo.org/lscsoft/source/lalsuite/${pkgname}-${pkgver}.tar.xz")
sha256sums=('e384f21f788c8c0521e3f9d50cc40e9e7d333f63cebbdac73b206658c45ffffe')
package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    sed -i 's/\-Werror//g' configure
    ./configure --prefix=$pkgdir/usr
    make -j
    make install
}
