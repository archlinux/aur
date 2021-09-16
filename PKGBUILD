# Maintainer: Alex Wicks <alex@awicks.io>

pkgname=buildkit-bin
pkgver=0.9.0
pkgrel=1
pkgdesc='A toolkit for converting source code to build artifacts in an efficient, expressive and repeatable manner.'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/moby/buildkit'
license=('Apache')
provides=('buildkit')
conflicts=('buildkit')
depends=('runc' 'containerd')
source=('buildkit.service' 'buildkit.socket')
source_x86_64=("buildkit-${pkgver}.tar.gz::https://github.com/moby/buildkit/releases/download/v${pkgver}/buildkit-v${pkgver}.linux-amd64.tar.gz")
source_aarch64=("buildkit-${pkgver}.tar.gz::https://github.com/moby/buildkit/releases/download/v${pkgver}/buildkit-v${pkgver}.linux-arm64.tar.gz")
source_armv7h=("buildkit-${pkgver}.tar.gz::https://github.com/moby/buildkit/releases/download/v${pkgver}/buildkit-v${pkgver}.linux-arm-v7.tar.gz")

sha512sums=(
  'b10773a29d713f717378ef40d1d622b42939e181db255bf80e1543c67c7d7cdd6ce212bf2729c76940d9138fb0fb9af2c1a4b067951d390602d0e6b733243d9b'
  '5c752695cc09310d383e657b48add7f68406f54ce798285d5c073b33ff0959da99cbe4b2d7eb3a7d5c98bdf4c60d4cba27491d96dc4fb32267038d8476a62c34'
)
sha512sums_x86_64=('15269ea409920e24b94a634643b1d1c198d7f6738d1ffff1a378c5ca0d02f482e50711915f8d3782bdda36ae420d939c0183b54c13e450adc5c4c1d002d64e19')
sha512sums_aarch64=('d41f30d27ceaf7f015f742a017a67ab25c519f28f8a2cb4ed5ac7f8b797cb28dd79afc06b908ca0fce8649c060a7c1d27ab5b81352dd58c4ef437fdb5a1c05a0')
sha512sums_armv7h=('6e54450569d8f8126aa50dadccf31d2d6b1085f7dbd4a5bd29b08d2b3b0c9712c6eb77d7fe4a7b5e823bd1484f45b06a8a960ff41f8adeaba3d985d3286cef58')

package() {
  install -Dm755 "${srcdir}/bin/buildctl" "${pkgdir}/usr/bin/buildctl"
  install -Dm755 "${srcdir}/bin/buildkitd" "${pkgdir}/usr/bin/buildkitd"
  install -Dm755 "${srcdir}/bin/buildkitd" "${pkgdir}/usr/bin/buildkit-qemu-aarch64"
  install -Dm755 "${srcdir}/bin/buildkitd" "${pkgdir}/usr/bin/buildkit-qemu-arm"
  install -Dm755 "${srcdir}/bin/buildkitd" "${pkgdir}/usr/bin/buildkit-qemu-i386"
  install -Dm755 "${srcdir}/bin/buildkitd" "${pkgdir}/usr/bin/buildkit-qemu-mips64"
  install -Dm755 "${srcdir}/bin/buildkitd" "${pkgdir}/usr/bin/buildkit-qemu-mips64el"
  install -Dm755 "${srcdir}/bin/buildkitd" "${pkgdir}/usr/bin/buildkit-qemu-ppc64le"
  install -Dm755 "${srcdir}/bin/buildkitd" "${pkgdir}/usr/bin/buildkit-qemu-riscv64"
  install -Dm755 "${srcdir}/bin/buildkitd" "${pkgdir}/usr/bin/buildkit-qemu-s390x"
  install -Dm755 "${srcdir}/bin/buildkitd" "${pkgdir}/usr/bin/buildkit-runc"

  install -Dm644 "${srcdir}/buildkit.service" "${pkgdir}/usr/lib/systemd/system/buildkit.service"
  install -Dm644 "${srcdir}/buildkit.socket" "${pkgdir}/usr/lib/systemd/system/buildkit.socket"
}

# vim: ts=2 sw=2 et:
