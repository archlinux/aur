# Maintainer: Connor Etherington <connor@concise.cc>
# ---
_pkgname=AutoLinux
pkgname=auto
pkgver=3.0.6
pkgrel=1
pkgdesc='ArchLinux bootstrap and partitioning scripts, with optional AutoLinux configs.'
arch=(x86_64)
url="https://gitlab.com/a4to/${_pkgname}"
install="auto.install"
license=('MIT')
depends=(dialog parted)
makedepends=(git)                 
source=("https://gitlab.com/a4to/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst")
sha256sums=('c352573f1fa1046b4531ffe47967437cd26994affd603786eddc4171400db43b')

package() {
    install -Dm755 ${_pkgname}/{autoInstall,autoCleanInstall,autoPart} -t "${pkgdir}/opt/${_pkgname}"
    install -Dm755 ${_pkgname}/{autoCleanInstall,autoInstall,autoPart} -t "${pkgdir}/usr/bin"
    install -Dm644 ${_pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 ${_pkgname}/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
