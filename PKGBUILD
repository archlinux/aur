# Maintainer: Serge <arch@phnx47.net>

# Auto Upgrade: https://github.com/phnx47/pkgbuilds

_pkgname=nub
pkgname="${_pkgname}-bin"
pkgver=0.8.0
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
sha256sums_x86_64=('11d4c09298fa3977d8ee76f32600af1c8d0d4ba03ba839ffe6d4df5e8052513b')
sha256sums_aarch64=('c8916cfb392659352a4c3c1986ef6ba77fe929b770cef5fbded873c644885630')


package() {
  install -Dm 755 "bin/${_pkgname}" -t "${pkgdir}/usr/bin"
  # nubx is the same binary, dispatched on argv[0]
  ln -s ${pkgname} "${pkgdir}/usr/bin/${pkgname}x"

  install -Dm 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
