# Maintainer: Serge K <arch@phnx47.net>

# Auto Upgrade: https://github.com/phnx47/pkgbuilds

_pkgname=nub
pkgname="${_pkgname}-bin"
pkgver=0.7.5
pkgrel=1
pkgdesc='The fast all-in-one Node.js toolkit'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url="https://nubjs.com"
arch=('x86_64' 'aarch64')
depends=('gcc-libs')
source=("LICENSE::https://raw.githubusercontent.com/nubjs/nub/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${_pkgname}-${pkgver}-${arch[0]}.tar.xz::https://github.com/nubjs/nub/releases/download/v${pkgver}/nub-linux-x64.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-${arch[1]}.tar.xz::https://github.com/nubjs/nub/releases/download/v${pkgver}/nub-linux-arm64.tar.gz")
sha256sums=('950fffd5e5c4c4be9e44ccf80bcf5147b25afc19bfef2f53a1e87facb1144b66')
sha256sums_x86_64=('34ad027792b7702e88f71eadde9fc2bf4ebade13a1c91b92fa056954f15880eb')
sha256sums_aarch64=('de28e3df5a84fb410640d7ab820e172401d85d63ba44d4b6f6454bf9c27380d3')


package() {
  install -Dm 755 "bin/${_pkgname}" -t "${pkgdir}/usr/bin"
  # nubx is the same binary, dispatched on argv[0]
  ln -s ${pkgname} "${pkgdir}/usr/bin/${pkgname}x"

  install -Dm 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
