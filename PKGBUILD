# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=lalinspiral
pkgver=1.7.7
pkgrel=2
pkgdesc="The LIGO Scientific Consortium Algorithm Library Suite. lalinspiral"
arch=(any)
url="https://wiki.ligo.org/DASWG/LALSuiteInstall"
license=('unknown')
groups=('lalsuite')
depends=('lalcore' 'lalmetaio' 'lalsimulation' 'lalframe')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://software.ligo.org/lscsoft/source/lalsuite/${pkgname}-${pkgver}.tar.xz")
sha256sums=('cb95e290693df143b4a11f6e08cffd74b29c1beb71790f9d774d4dc159d7ffd1')
package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    sed -i 's/\-Werror//g' configure
    ./configure --prefix=$pkgdir/usr
    make -j
    make install
}
