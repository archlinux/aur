# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=lalxml
pkgver=1.2.4
pkgrel=2
pkgdesc="The LIGO Scientific Consortium Algorithm Library Suite. lalxml"
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
sha256sums=('5509bcc9cbce0b497036d3fc87628d1cbaa9f33af20cf33609cabd9c6ee398f1')
package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    sed -i 's/\-Werror//g' configure
    ./configure --prefix=$pkgdir/usr
    make -j
    make install
}
