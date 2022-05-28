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
  'e50cfe2c3e9e14f5f1372dd8b11e00735cace9570c09596a1b56235e8d2b0fa09b2e41febc94b0f84f33313c7a6e638e5086e4e8d40e32b302087bf882fe478f'
  'a9e67de7c4c5877c8270019b04f5338b4f782ec1cb87d1f57764a926b1988d5141bde842b12268d8b1a87809be194d17f1f7f93f81a1cbc3cce23cac605dfc8a'
  )
md5sums=(
  'b4962df4948bb3b0d5bccc8cce69c4d3'
  '1001dc6946519fbe775889feef84257a'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 usr/share/man/man1/${pkgname}.1.gz "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
    install -Dm644 usr/share/doc/${pkgname}/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}

