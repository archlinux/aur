# Maintainer: Oliver Rümpelein <arch@pheerai.de>
pkgname=mergerfs
pkgver=2.20.0
pkgrel=1
pkgdesc="Another FUSE union filesystem"
arch=('i686' 'x86_64')
url="https://github.com/trapexit/mergerfs"
source=("https://github.com/trapexit/mergerfs/archive/2.20.0.tar.gz")
options=("!emptydirs")
license=('MIT')
depends=(fuse)
sha512sums=('fe8826868fb407a9aaf89eebe9119caeb98b0c5fe15d26075fbe2ab07a018bc9e31bf8ac6366f3be531095477de6596a6e4b90a8952e37bf608e70f11c2d1fb4')

package()
{
    cd "${srcdir}/mergerfs-2.20.0" || exit
    mkdir -p "${pkgdir}"/usr/{share,bin}
    mkdir -p "${pkgdir}"/usr/share/licenses/mergerfs
    make DESTDIR=${pkgdir} PREFIX=/usr SBINDIR="/usr/bin" install
    install -m 644 LICENSE "${pkgdir}/usr/share/licenses/mergerfs/LICENSE"
}

build()
{
    cd ./"mergerfs-2.20.0" || exit
    make DESTDIR="${pkgdir}" PREFIX="/usr" SBINDIR="/usr/bin"
}

