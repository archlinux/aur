# Maintainer: Oliver Rümpelein <arch@pheerai.de>
pkgname=mergerfs
pkgver=2.17.0
pkgrel=1
pkgdesc="Another FUSE union filesystem"
arch=('i686' 'x86_64')
url="https://github.com/trapexit/mergerfs"
source=("https://github.com/trapexit/mergerfs/releases/download/2.17.0/mergerfs-2.17.0.tar.gz")
options=("!emptydirs")
license=('MIT')
depends=(fuse)
sha512sums=('5530dc5c77a8a514b4f99c996cb11c17c9f0dfce8df542668c626918efad0a6b143daa614e3663fcaf969da34e7c1293d17b4f35f17ceb890e4d880b1d5e29b1')

package()
{
    cd "${srcdir}/mergerfs-2.17.0" || exit
    mkdir -p "${pkgdir}"/usr/{share,bin}
    mkdir -p "${pkgdir}"/usr/share/licenses/mergerfs
    make DESTDIR=${pkgdir} PREFIX=/usr SBINDIR="/usr/bin" install
    install -m 644 LICENSE "${pkgdir}/usr/share/licenses/mergerfs/LICENSE"
}

build()
{
    cd ./"mergerfs-2.17.0" || exit
    make DESTDIR="${pkgdir}" PREFIX="/usr" SBINDIR="/usr/bin"
}

