# Maintainer: Oliver Rümpelein <arch@pheerai.de>
pkgname=mergerfs
pkgver=2.23.1
pkgrel=2
pkgdesc="Another FUSE union filesystem"
arch=('i686' 'x86_64')
url="https://github.com/trapexit/mergerfs"
source=("https://github.com/trapexit/mergerfs/releases/download/2.23.1/mergerfs-2.23.1.tar.gz")
options=("!emptydirs")
license=('MIT')
depends=(fuse)
sha512sums=('d9e9788e96cb93a68a49fc3b12862cf11305951d2309afeac4d34c07909a1c8b47ebf06556dcb538f0f216c734d3076875fa644ac3682a7ba400d16f9a9a3aba')

package()
{
    cd "${srcdir}/mergerfs-2.23.1"
    mkdir -p "${pkgdir}"/usr/{share,bin}
    mkdir -p "${pkgdir}"/usr/share/licenses/mergerfs
    make DESTDIR=${pkgdir} PREFIX=/usr SBINDIR="/usr/bin" install
    install -m 644 LICENSE "${pkgdir}/usr/share/licenses/mergerfs/LICENSE"
}

build()
{
    cd ./"mergerfs-2.23.1"
    make DESTDIR="${pkgdir}" PREFIX="/usr" SBINDIR="/usr/bin"
}

