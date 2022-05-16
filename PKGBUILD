# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=pkd
pkgver=1.1
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
  '80f783e309642ce88af43b595d08d78a497378ac3443b192de446f42f439778066cba1ad0263d8cc1970a6bf975fd15779ce618d5758b49cd53cd4c3b15ec8fa'
  'b2117947d4b7e3ab64d9fe58f6fa393d39c83e808c7cfc9b7eb8ceba1447133168e0df4bc90e7292a68f976b013f5a7d800c9a80f593d405a80e7826224d3c2c'
  )
md5sums=(
  'd722d323248da143f15e2bf3df014b83'
  '403a3d3852e236cc90a4d9d53bee2f85'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 usr/share/doc/${pkgname}/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}

