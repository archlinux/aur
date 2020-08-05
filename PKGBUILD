# Maintainer: zer0def <zer0def@github>
pkgname=firecracker-bin
pkgver=0.22.0
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
    ac9544e8b770ff7a0c9234feb3154522bd6163f3903993cd019cc4abaa90ad24447f18e65e1022aafb7274ca97281286f898a50ac9f27c7f661d48df52d7fd08
    f2dcaee775cd1cdea4c1c1f6e89b82ba6636ab065291b704faaa836f864f14802a56af76ce397d7f98e9420d55720dc4459ae4443babfc7bb16d64dde11cb854
  );;
  aarch64) sha512sums=(
    fb42bc5ecd0af487490f2c4bd3804d2430263740bbdec66c063d9b6c865d6b9c42b31cafb78d4a0cc40c11cc5242608b9d30676e55ac2b8dcb05d5f3db535bdf
    86ca629b3060cefa9e31292844486c6d9b6fa0538b6d515e4cbb07fa4a675ce93d5f87fcd769f62aea0df029cdbd7a5055a282b8344ed35d895606aca7f22a14
  );;
esac

package() {
  install -Dm755 "${srcdir}/firecracker-v${pkgver}-${CARCH}" ${pkgdir}/usr/bin/firecracker
  install -Dm755 "${srcdir}/jailer-v${pkgver}-${CARCH}" ${pkgdir}/usr/bin/jailer
}
