# Maintainer: Rajdeep Malakar <rajdeepm.dev@gmail.com>
# Contributor: Alex Wicks <alex@awicks.io>

pkgname=buildkit-bin
pkgver=0.12.5
pkgrel=1
pkgdesc="concurrent, cache-efficient, and Dockerfile-agnostic builder toolkit"
arch=('x86_64' 'armv7h' 'aarch64' 'riscv64')
url='https://github.com/moby/buildkit'
license=('Apache')
provides=('buildkit')
conflicts=('buildkit')
depends=('runc' 'containerd')
source=('buildkit.service' 'buildkit.socket')
source_x86_64=("buildkit-${pkgver}.tar.gz::https://github.com/moby/buildkit/releases/download/v${pkgver}/buildkit-v${pkgver}.linux-amd64.tar.gz")
source_aarch64=("buildkit-${pkgver}.tar.gz::https://github.com/moby/buildkit/releases/download/v${pkgver}/buildkit-v${pkgver}.linux-arm64.tar.gz")
source_armv7h=("buildkit-${pkgver}.tar.gz::https://github.com/moby/buildkit/releases/download/v${pkgver}/buildkit-v${pkgver}.linux-arm-v7.tar.gz")
source_riscv64=("buildkit-${pkgver}.tar.gz::https://github.com/moby/buildkit/releases/download/v${pkgver}/buildkit-v${pkgver}.linux-riscv64.tar.gz")

b2sums=(
	"6de06e17baace60e6ff9afcbcb14d6700d7b420e81fb806787d9fb5c9e54809907c3cc5165db63acfe66e1530764ee49c218decc5c9003b1ccc89bb4ced57b50"
	"4539f29ed0f591ba7faf12b53b41c978e54fb54b35ea313c58bd4bf778abf35e5ff76f20f3e90b8d66c3cf548d07edcd56cefada667c341fd1596ead0e6e9b73"
)

b2sums_x86_64=("9ce5750ae7bfd97adb7fa2f28e20a5b0a9eab7ce6c0b60b300af83e5ee1c16cf7e0d6dea391e96b0552c7b00c5b868f70a5b4002503e298faf787e329a7d915f")
b2sums_aarch64=('ead9487165f7547a30427892619b8ad8338b355f00d7fec7b358730ac18663c7c7b1cd5d5081027acde666b660bb2718b09cd88d636d10a3d6e9fdfb47d86e0f')
b2sums_armv7h=("6e5eff779d14ccc454680155d667dd68cbbf4cb121c97d688813d81ceaeb0d30e8866b41722b360919d5fe0f2fd2a8ac4052aff0bfa73ad27dca4c362f9a18f6")
b2sums_riscv64=("295c28f84c697acec1fa4923d964bbf6d6187453599ccfa7a03ede3fbcc35d67b97950feb75f5386bd6d1e811fc94a596f5869a854b5ad79d82e64edc9ccf45f")

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
