# Maintainer: Pooyan Khanjankhani <pooyankhan@gmail.com>
# SPDX-FileCopyrightText: 2025 Pooyan Khanjankhani <pooyankhan@gmail.com>
#
# SPDX-License-Identifier: 0BSD

pkgname=ella-bin
pkgver="0.0.8"
pkgrel=2
pkgdesc="A process manager for running and managing services"
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h' 'armv6l' 'riscv64')
url="https://github.com/thekhanj/ella"
conflicts=("ella")
license=('MIT')

_baseurl="${url}/releases/download/v${pkgver}"

sha256sums_x86_64=('b41ff2d957e93cce2c3746b39876443b4482225bf664a4e99964a98d8eeea667')
sha256sums_aarch64=('a9ebdfd0f062a79603ec90d08d885e1b543017ef97b2cccd5ee31cd1c8811af4')
sha256sums_armv7h=('7dd2b07c61a69bc6183a2308bc7aebea591866944a84fbf5041d73e44dacc5cc')
sha256sums_armv6h=('7dd2b07c61a69bc6183a2308bc7aebea591866944a84fbf5041d73e44dacc5cc')
sha256sums_armv6l=('b6dd65e4aaa33b49f9aafafaadebb6513926cdf57784ee23b9c4149896d33bfd')
sha256sums_riscv64=('46d751b2f0b8db2a7b35bd576a2d3407fa708c602568f87ebfc1c57bb0878680')

case "$CARCH" in
x86_64) _binname="ella_v${pkgver}_linux_amd64" ;;
aarch64) _binname="ella_v${pkgver}_linux_arm64" ;;
armv7h | armv6h) _binname="ella_v${pkgver}_linux_arm_hf" ;;
armv6l) _binname="ella_v${pkgver}_linux_arm" ;;
riscv64) _binname="ella_v${pkgver}_linux_riscv64" ;;
*)
	echo "unsupported arch: ${CARCH}"
	exit 1
	;;
esac

source_x86_64=("${_baseurl}/${_binname}.tar.gz")
source_aarch64=("${_baseurl}/${_binname}.tar.gz")
source_armv7h=("${_baseurl}/${_binname}.tar.gz")
source_armv6h=("${_baseurl}/${_binname}.tar.gz")
source_armv6l=("${_baseurl}/${_binname}.tar.gz")
source_riscv64=("${_baseurl}/${_binname}.tar.gz")

package() {
	cd "${srcdir}/${_binname}"
	./install "${pkgdir}" false
}
