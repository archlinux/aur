# Maintainer: zer0def <zer0def@github>
pkgname=firecracker-bin
pkgver=0.19.1
pkgrel=1
pkgdesc="Secure and fast microVMs for serverless computing"
url="https://github.com/firecracker-microvm/firecracker"
arch=('x86_64' 'aarch64')
license=('Apache:2.0')
provides=('firecracker')
source=(
    "firecracker::https://github.com/firecracker-microvm/firecracker/releases/download/v${pkgver}/firecracker-v${pkgver}-${CARCH}"
    "jailer::https://github.com/firecracker-microvm/firecracker/releases/download/v${pkgver}/jailer-v${pkgver}-${CARCH}"
)
[ "${CARCH}" = "x86_64" ] && sha512sums=(
    'cfd75d2554f21b0030706286e3da4aed0d9138a802d225432e1fa30101bda9a461681eddff10fd16d7804a8ffd09a424509e7301771aa3025398f1ce790b9422'
    'd1e3412c868468787450684d360c6a1a858100af5b7553390b5859c0d4557774583613112695ca7009408fa8c140d63e67d3df56e9ca73d593a6feba409b4b5e'
)
[ "${CARCH}" = "aarch64" ] && sha512sums=(
    'e6e27f2e36c548aac72be250d4138f7b56ad40ec31475457496c708196197bdbaed6d9763392ce2f8b6843fb213c67dadfbb4ed497000513bf388e2cf3b8ac54'
    'ab8b3c51a7aa4ca4774987ca30e3ee453f6a5bfe8f6c2ee20aa883b7797b5cd84775efa5550b1e5b8f2c79dd4c81fecc01baf7fdceedf59d7cbbaacfed94b721'
)

package() {
  install -Dm755 -t ${pkgdir}/usr/bin ${srcdir}/{firecracker,jailer}
}
