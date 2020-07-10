# Maintainer: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Sam Stuewe <halosghost at archlinux dot info>
#
# Use extra-x86_64-build --  -d /dev/fuse to build in a clean chroot

pkgname=pbpst
pkgver=1.4.1
pkgrel=2
pkgdesc='A small tool to interact with pb instances'
url='https://github.com/HalosGhost/pbpst'
arch=('x86_64')
license=('GPL2')
depends=('curl' 'jansson')
makedepends=('git' 'tup' 'clang' 'python-sphinx')
source=("$pkgname-$pkgver.tar.gz::https://github.com/HalosGhost/pbpst/archive/v${pkgver}.tar.gz")
md5sums=('2fec0dbd1d139f504fd8a2036ea2086e')

build () {
    cd "pbpst-${pkgver}"

    ./configure --prefix='/usr' --cflags="$CFLAGS"

    make
}

package () {
    cd "pbpst-${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX='/usr' install
}
