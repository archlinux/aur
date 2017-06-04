# Maintainer: Oliver Rümpelein <arch@pheerai.de>
pkgname=mergerfs
pkgver=2.22.0
pkgrel=1
pkgdesc="Another FUSE union filesystem"
arch=('i686' 'x86_64')
url="https://github.com/trapexit/mergerfs"
source=("https://github.com/trapexit/mergerfs/archive/2.22.0.tar.gz")
options=("!emptydirs")
license=('MIT')
depends=(fuse)
sha512sums=('0a28de087fcd59ea4b5066c266f893a0c30db90314c3d790de403fe481f94bcaa8eb3f02ccf88544248f7ac18dcf20ac40894c21318b957d3e13fcceb6bd4bf8')

package()
{
    cd "${srcdir}/mergerfs-2.22.0" || exit
    mkdir -p "${pkgdir}"/usr/{share,bin}
    mkdir -p "${pkgdir}"/usr/share/licenses/mergerfs
    make DESTDIR=${pkgdir} PREFIX=/usr SBINDIR="/usr/bin" install
    install -m 644 LICENSE "${pkgdir}/usr/share/licenses/mergerfs/LICENSE"
}

build()
{
    cd ./"mergerfs-2.22.0" || exit
    make DESTDIR="${pkgdir}" PREFIX="/usr" SBINDIR="/usr/bin"
}

