# Maintainer: Oliver Rümpelein <arch@pheerai.de>
pkgname=mergerfs
pkgver=2.18.0
pkgrel=1
pkgdesc="Another FUSE union filesystem"
arch=('i686' 'x86_64')
url="https://github.com/trapexit/mergerfs"
source=("https://github.com/trapexit/mergerfs/releases/download/2.18.0/mergerfs-2.18.0.tar.gz")
options=("!emptydirs")
license=('MIT')
depends=(fuse)
sha512sums=('da2492e9a00f990907355028d58eceeefe1260d4d42c3e0b32ba8dd3fd91c2a91189e042e0ec18f5530b9f838efa29f5189e38a3cf8e44cabd3490a982ee81f8')

package()
{
    cd "${srcdir}/mergerfs-2.18.0" || exit
    mkdir -p "${pkgdir}"/usr/{share,bin}
    mkdir -p "${pkgdir}"/usr/share/licenses/mergerfs
    make DESTDIR=${pkgdir} PREFIX=/usr SBINDIR="/usr/bin" install
    install -m 644 LICENSE "${pkgdir}/usr/share/licenses/mergerfs/LICENSE"
}

build()
{
    cd ./"mergerfs-2.18.0" || exit
    make DESTDIR="${pkgdir}" PREFIX="/usr" SBINDIR="/usr/bin"
}

