# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=auto
pkgver=3.0.7
pkgrel=1
pkgdesc='ArchLinux bootstrap and partitioning scripts, with optional AutoLinux configs.'
arch=(x86_64)
url="https://gitlab.com/a4to/${pkgname}"
install="auto.install"
license=('MIT')
depends=(dialog parted)
makedepends=(git)                 
source=("https://gitlab.com/a4to/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst")
sha256sums=('d9f23fdef27e34003ae14b253ef97d93d44bf6bbaaa20e53fb81449ebfd11f00')

package() {
    install -Dm755 ${pkgname}/{autoInstall,autoCleanInstall,autoPart} -t "${pkgdir}/opt/${_pkgname}"
    install -Dm755 ${pkgname}/{autoCleanInstall,autoInstall,autoPart} -t "${pkgdir}/usr/bin"
    install -Dm644 ${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 ${pkgname}/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
