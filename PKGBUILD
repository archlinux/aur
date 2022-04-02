# Maintainer: Connor Etherington <connor@concise.cc>
# ---
_pkgname=AutoLinux
pkgname=auto
pkgver=3.0.3
pkgrel=1
pkgdesc='ArchLinux bootstrap and partitioning scripts, with optional AutoLinux configs.'
arch=(x86_64)
url="https://gitlab.com/qYp/${_pkgname}"
license=('MIT')
depends=(dialog parted)
makedepends=(git)                 
source=("https://gitlab.com/qYp/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst")
sha256sums=('b273a67d4a1145cb3ae0c4b4e1b7dabec4bd3dc8f167b227b9019c6925996da0')

package() {
    install -Dm755 ${_pkgname}/{autoInstall,autoCleanInstall,autoPart} -t "${pkgdir}/opt/${_pkgname}"
    install -Dm755 ${_pkgname}/{autoCleanInstall,autoInstall,autoPart} -t "${pkgdir}/usr/bin"
    install -Dm644 ${_pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
