# Maintainer: Alex Wicks <alex@awicks.io>

pkgname=buildkit-bin
pkgver=0.9.1
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
sha512sums_x86_64=('8c0548d339ebc2b2ff98b426ab02884a4776bf50708c5a1423381c3427087a4c23dfc77d300db00dbf40557337fbaea6f705447082b1db73b22c4b80ccb3f0fd')
sha512sums_aarch64=('d87e9c955f26ec88fe4ba1c37e5c3e801903992487155c0b02d3199a0db49dc7ccf9f60e0333bf0eed77eff01b8b7d5c4fc92185f58848e9e557ee0f99f66611')
sha512sums_armv7h=('e4b885b055e6b947a3a6f4afcb5a01202f74d20d8ddad2d73bb68aa380e3bfa6118138f3f6cf273d702308269bea453b4eb7086370eb44b4b53f6cb9f57ab903')

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
