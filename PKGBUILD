# Maintainer: zer0def <zer0def@github>
pkgname=firecracker-bin
pkgver=0.21.2
pkgrel=1
pkgdesc="Secure and fast microVMs for serverless computing"
url="https://github.com/firecracker-microvm/firecracker"
arch=('x86_64' 'aarch64')
license=('Apache:2.0')
provides=('firecracker')
source=(
    "https://github.com/firecracker-microvm/firecracker/releases/download/v${pkgver}/firecracker-v${pkgver}-${CARCH}"
    "https://github.com/firecracker-microvm/firecracker/releases/download/v${pkgver}/jailer-v${pkgver}-${CARCH}"
)

case "${CARCH}" in
  x86_64)  sha512sums=(
    97378c52400ec7fef51a713f4f93e853f5807b390226fbdf429f304cc0c2335e8a33c4d5bc513fe4c4e98a34af56d02252c9b99037178071765e492c222e5977
    dcb670a15c0cc4d57412d86ab73a23b58903bcb3586e0ca7ff72a71e6e42161913e5c71f9005aac3b52e12800e39fc365a71c2d9fa907333beb854e197b8432b
  );;
  aarch64) sha512sums=(
    dc9b21eb21083e4d96b268aab64e62bc4bdc759b9890cb4887dd917593d2d8564df5c69938adad26f28708b13a572de9d6efc1c1997f92a3f47e046751935c95
    4b8b7cd334e0625871b3df14afeabac34606a6822929769d563f3cc7fc37fda2c6200580fb1b56238a17d229133cde74c2b2079e3fc858f2af0cb792cdbcc313
  );;
esac

package() {
  install -Dm755 "${srcdir}/firecracker-v${pkgver}-${CARCH}" ${pkgdir}/usr/bin/firecracker
  install -Dm755 "${srcdir}/jailer-v${pkgver}-${CARCH}" ${pkgdir}/usr/bin/jailer
}
