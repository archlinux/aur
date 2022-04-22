# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=auto
pkgver=4.1
pkgrel=1
pkgdesc='ArchLinux bootstrap and partitioning script, with a selection of WM and DEs'
arch=(x86_64)
url="https://gitlab.com/a4to/${pkgname}"
install="auto.install"
license=('MIT')
depends=(dialog)
source=(
  "https://gitlab.com/a4to/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://gitlab.com/a4to/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig")
sha256sums=('116c5e981b8a82776b8805e59f9b0da337febd9869f95ab580b772dd0a06e9e7'
            'SKIP')

package() {
    install -Dm755 usr/bin/{auto,autoCleanInstall,autoInstall,autoPart} -t "${pkgdir}/usr/bin"
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 usr/share/doc/${pkgname}/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
