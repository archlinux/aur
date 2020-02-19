# Maintainer: zer0def <zer0def@github>
pkgname=firecracker-bin
pkgver=0.21.0
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
    '3f8a16592f1dc8bf3652a26b03c2b7316964a4efdf5c53a134a9963bb1fca7366c3e1f120454db4cde7719b92191dd8c34ccc98e9bca548bc8fb8d10771d0f4d'
    '7f94814c53f15d70a5c2b375f342fc00667d50130cb8a44086b9a129949dae8d82b3ef88da2dfec7acf204fd20d0b6ab6fd6cc5b1b7cfc582d6734d716be8e1e'
)
[ "${CARCH}" = "aarch64" ] && sha512sums=(
    'd449e7f42de80337b3a173d925a5196b36d14d6d97b8664c1f6078f1396306d6e993632b356fb20ebc03bdda99916d13fa633b5a519eff9c3182ea8ad36e7476'
    'e771c2c38db89aeea79f950176b41a79ed1977f61e6b36468758a0f97e3e50db1b83891e6ef8421249f9f776c6013099a3348edfd39f3416d0976c11c360e803'
)

package() {
  install -Dm755 -t ${pkgdir}/usr/bin ${srcdir}/{firecracker,jailer}
}
