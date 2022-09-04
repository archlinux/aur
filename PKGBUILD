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
  'bca93ca44e08009a0b64a05ee81c77e480dc2b438cbb2f1ad1f8c61bf07216f07ad8afccdbbe9c1dfe585f3de3d76e86391996be1ef240e91b6895d9443077f2'
  '9e7a281b53d48207bad603123b0cc95b77cf3d37ffcfdec715c4a940841a5a275f89838fa0ecd525d89d0906aa84b9a089527255cc1aacede4eddb75e46f1d5d'
  )
md5sums=(
  'ac15d7d51d580f2854cb501f3f62eac4'
  'dc874d8e64c2ee8d2420edb07196d209'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 usr/share/man/man1/${pkgname}.1.gz "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
    install -Dm644 usr/share/doc/${pkgname}/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}

