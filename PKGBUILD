# Maintainer: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Sam Stuewe <halosghost at archlinux dot info>
# Use extra-x86_64-build --  -d /dev/fuse to build in a clean chroot

pkgname=pbpst
pkgver=1.0.0
pkgrel=1
pkgdesc='A small tool to interact with pb instances'
url='https://github.com/HalosGhost/pbpst'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('curl' 'jansson')
makedepends=('git' 'tup' 'clang' 'python-sphinx')
source=("https://github.com/HalosGhost/pbpst/archive/v${pkgver}.tar.gz")
md5sums=('3e868197a3530b59f6696d3afe83e81a')

build () {
    cd "pbpst-${pkgver}"
    make
}

package () {
    cd "pbpst-${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX='/usr' install
}
