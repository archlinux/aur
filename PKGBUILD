# Maintainer: Oliver Rümpelein <arch@pheerai.de>
pkgname=mergerfs
pkgver=2.23.1
pkgrel=1
pkgdesc="Another FUSE union filesystem"
arch=('i686' 'x86_64')
url="https://github.com/trapexit/mergerfs"
source=("https://github.com/trapexit/mergerfs/archive/2.23.1.tar.gz")
options=("!emptydirs")
license=('MIT')
depends=(fuse)
sha512sums=('1f2ecb162bd2aee390d5067a888f38c0b7137022f7447b93ff2b743d759b815408f6f09e68bcf240e5274d6c872b9a8c9cbe48b5e11538ae0af02713a4f66745')

package()
{
    cd "${srcdir}/mergerfs-2.23.1" || exit
    mkdir -p "${pkgdir}"/usr/{share,bin}
    mkdir -p "${pkgdir}"/usr/share/licenses/mergerfs
    make DESTDIR=${pkgdir} PREFIX=/usr SBINDIR="/usr/bin" install
    install -m 644 LICENSE "${pkgdir}/usr/share/licenses/mergerfs/LICENSE"
}

build()
{
    cd ./"mergerfs-2.23.1" || exit
    make DESTDIR="${pkgdir}" PREFIX="/usr" SBINDIR="/usr/bin"
}

