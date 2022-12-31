# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=pman
pkgver=1.3
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
  'b9ce0b4c4342f2012cc096e87bcc383890d0c324a5960a5ce5f76a8db6d8928ed940e98e9f25006f34e827c5361fd1cd573a5840f9b7b367c1654b4dcf86f135'
  '5c0eeaf3e1761cb965e69d208669256d65e4466f8b7f6ed8117b10ea5917fd571a2bf604f57d93eb1cb4e7faa3cb6abe5180e8b6b5913319df6901eb9bfebfda'
  )
md5sums=(
  'd81f9d3b53b31b3261ad3a31a1c551fc'
  '6e538acc0a1c93ca3ab71e97f50c9670'
  )
validpgpkeys=('9A1F3F41DDA55A60331CB8DD3714CB0967D15980')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 usr/share/man/man1/${pkgname}.1.gz "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
    install -Dm644 usr/share/doc/${pkgname}/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}

