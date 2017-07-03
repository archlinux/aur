# Maintainer: Oliver Rümpelein <arch@pheerai.de>
pkgname=mergerfs
pkgver=2.23.0
pkgrel=1
pkgdesc="Another FUSE union filesystem"
arch=('i686' 'x86_64')
url="https://github.com/trapexit/mergerfs"
source=("https://github.com/trapexit/mergerfs/archive/2.23.0.tar.gz")
options=("!emptydirs")
license=('MIT')
depends=(fuse)
sha512sums=('46f8c083333370a19f5f8b11e016456140b2cd32f5fe8dec344b09f89738305a8a5cfe94cc04943ba827fad4b82a2569e63ec771252501a1cf2e7928ba7e2b82')

package()
{
    cd "${srcdir}/mergerfs-2.23.0" || exit
    mkdir -p "${pkgdir}"/usr/{share,bin}
    mkdir -p "${pkgdir}"/usr/share/licenses/mergerfs
    make DESTDIR=${pkgdir} PREFIX=/usr SBINDIR="/usr/bin" install
    install -m 644 LICENSE "${pkgdir}/usr/share/licenses/mergerfs/LICENSE"
}

build()
{
    cd ./"mergerfs-2.23.0" || exit
    make DESTDIR="${pkgdir}" PREFIX="/usr" SBINDIR="/usr/bin"
}

