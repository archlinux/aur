# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=pman
pkgver=1.2
pkgrel=1
pkgdesc="A minimal CLI download manager for all major package managers and URLs/Torrents"
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(dialog)
optdepends=(
  "git: To clone git repositories"
  "npm: To download npm packages."
  "snapd: To download and install snap packages."
  "flatpak: To download and install flatpak packages."
  "python-pip: To download python packages."
  "aria2: To download files or torrents from URLs."
  )
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  '4f600004be41183cf88f5b9128926bb6b3c65996b1ef079a72e6f42607de0101ee120c074a8cc56bedc4ad57c076b9070f019f5e4493fc8b7e20af945e0b57fa'
  '314ae781f0df4b352cee1af1f2b2c304f026d5302f2398ecd21dc987a457233a7f5bcddce121a5b1cf1c74d5827d4f53e5e3cd07230a71000bd30de07d3ffded'
  )
md5sums=(
  'b121a43608f8353f191080f606c24f8d'
  '5300769cfb41b782ae8f20aa152b20d9'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 usr/share/man/man1/${pkgname}.1.gz "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
    install -Dm644 usr/share/doc/${pkgname}/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}

