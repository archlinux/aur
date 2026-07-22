# Maintainer: Serge K <arch@phnx47.net>

_pkgname=nub
pkgname="${_pkgname}-bin"
pkgver=0.4.13
pkgrel=1
pkgdesc='The fast all-in-one Node.js toolkit'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url='https://github.com/nubjs/nub'
arch=('x86_64' 'aarch64')
depends=('gcc-libs')
source=("LICENSE::https://raw.githubusercontent.com/nubjs/nub/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${_pkgname}-${pkgver}-${arch[0]}.tar.xz::${url}/releases/download/v${pkgver}/nub-linux-x64.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-${arch[1]}.tar.xz::${url}/releases/download/v${pkgver}/nub-linux-arm64.tar.gz")
sha256sums=('950fffd5e5c4c4be9e44ccf80bcf5147b25afc19bfef2f53a1e87facb1144b66')
sha256sums_x86_64=('4ce52b4e2b3ffc58d273f3cbc4a4bf2149e78c4b1b130eac69fc58dbca4591f3')
sha256sums_aarch64=('b834d5deb7ba0659201d4ce5701805ee190eb70c8a55261591557fe748a81c5d')


package() {
  install -Dm 755 "bin/${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm 755 "bin/${_pkgname}x" -t "${pkgdir}/usr/bin"

  install -Dm 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
