# Maintainer: Oliver Rümpelein <arch@pheerai.de>
pkgname=mergerfs
pkgver=2.24.2
pkgrel=1
pkgdesc="Another FUSE union filesystem"
arch=('i686' 'x86_64')
url="https://github.com/trapexit/mergerfs"
source=("https://github.com/trapexit/mergerfs/releases/download/2.24.2/mergerfs-2.24.2.tar.gz")
options=("!emptydirs")
license=('MIT')
depends=(fuse)
sha512sums=('4b7fef29385e27a695062e204cbeb631212e0a29f42e7d859f4cce7819182e58738ded5dab5763b2652f1bacaf6963dc6c78f08bc1c57531db6ce600f0d9ea42')

package()
{
    cd "${srcdir}/mergerfs-2.24.2"
    mkdir -p "${pkgdir}"/usr/{share,bin}
    mkdir -p "${pkgdir}"/usr/share/licenses/mergerfs
    make DESTDIR=${pkgdir} PREFIX=/usr SBINDIR="/usr/bin" install
    install -m 644 LICENSE "${pkgdir}/usr/share/licenses/mergerfs/LICENSE"
}

build()
{
    cd ./"mergerfs-2.24.2"
    make DESTDIR="${pkgdir}" PREFIX="/usr" SBINDIR="/usr/bin"
}

