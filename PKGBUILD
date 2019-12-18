# Maintainer: zer0def <zer0def@github>
pkgname=firecracker-bin
pkgver=0.20.0
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
    '9f804ac3158665b672983e971484bb4f225ac0a651211a44d433ac081d54a3258cd023cd7c7cc46c0eda99ad9ab223e21710ffa2e855c526183d629fb92e5c23'
    'df228013f30b68b72627b24df4fd2e48edaa36890adac29351548589106b1d167c746022955953f17eacb26aa5470b566e579c932fb8561efd47f90127a23dc7'
)
[ "${CARCH}" = "aarch64" ] && sha512sums=(
    'ea03440e66aa603d2493935e954db2e12fe658555b054618d0a9840d60a5cee30a4ca8ebe78a3e33727041ccfe248945908f942a0be1c47f3ff382d22c8b6dde'
    'e784de3e37bdddc62c9fcb09d03e3af1692d3bf2702a310fa2a5517c17aacb85d48d157d56439c6eb396f20846c8098eb5eb1c538a86a7be586cf41044476117'
)

package() {
  install -Dm755 -t ${pkgdir}/usr/bin ${srcdir}/{firecracker,jailer}
}
