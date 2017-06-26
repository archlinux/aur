# Maintainer: Oliver Rümpelein <arch@pheerai.de>
pkgname=mergerfs
pkgver=2.22.1
pkgrel=1
pkgdesc="Another FUSE union filesystem"
arch=('i686' 'x86_64')
url="https://github.com/trapexit/mergerfs"
source=("https://github.com/trapexit/mergerfs/archive/2.22.1.tar.gz")
options=("!emptydirs")
license=('MIT')
depends=(fuse)
sha512sums=('f66df0796ac359976f0bdbe3acc0218596f170e186fdfbc26ce13ed39560d2118c94fd7be25f0fa2249a6eb73de597f4a0822e85dadc0e264e1e9c6d2bbcfbd0')

package()
{
    cd "${srcdir}/mergerfs-2.22.1" || exit
    mkdir -p "${pkgdir}"/usr/{share,bin}
    mkdir -p "${pkgdir}"/usr/share/licenses/mergerfs
    make DESTDIR=${pkgdir} PREFIX=/usr SBINDIR="/usr/bin" install
    install -m 644 LICENSE "${pkgdir}/usr/share/licenses/mergerfs/LICENSE"
}

build()
{
    cd ./"mergerfs-2.22.1" || exit
    make DESTDIR="${pkgdir}" PREFIX="/usr" SBINDIR="/usr/bin"
}

