# Maintainer: Alex Wicks <alex@awicks.io>

pkgname=buildkit-bin
pkgver=0.9.3
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
sha512sums_x86_64=('7cc3ab5ab37c5ceed76ac51dd66cbb248b2e9e9f57e40cf813856af216e0c5a25c290f247ac03bff959b4979ef7d58bac34f4c4ab7e93ada005baa5bdb84acca')
sha512sums_aarch64=('13d0cefccff2a8baa349545ed6c1cabafcda610e9354792594b8ed92a7bebe1471d15a48441cc51c7b44968cc29c39be174316a3deb05edd8f94a0c1e93d0563')
sha512sums_armv7h=('40b56cc1b826a95ac208afddeee858130359b5ec0da9adeda6c37a1a1c9c96b48845684a21a2fc79d12caadbd6e6223c4feb8acefba2ad963b60d28720fc1f1f')

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
