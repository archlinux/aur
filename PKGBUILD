# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=pkd
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
  'd19e13895e451642f8ba44165dc7c64f339de8905b172c4a76d446bb331b24e7be90b72d8b5f25b951931b8d33342e6e75dad132e2ac0b101f4ec6ce74856dd2'
  'bbe9f1bb6b30e05030abaa07f74bc62800d9c7aaf56dc5ba9f75d697f6999742129b9bc23c2758a3fc809f866f89cf47340f2ecfee395ae5e3a0f6f129a202b0'
  )
md5sums=(
  '2b601eabef9eba758f62c319b0048077'
  'f0b8bf78c26ec0d998b7964ed71ec1b3'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 usr/share/man/man1/${pkgname}.1.gz "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
    install -Dm644 usr/share/doc/${pkgname}/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}

