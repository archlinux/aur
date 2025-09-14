# Maintainer: Pooyan Khanjankhani <pooyankhan@gmail.com>
# SPDX-FileCopyrightText: 2025 Pooyan Khanjankhani <pooyankhan@gmail.com>
#
# SPDX-License-Identifier: 0BSD

pkgname=ella-bin
pkgver='0.0.9'
pkgrel=1
pkgdesc='A process manager for running and managing services'
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h' 'armv6l' 'riscv64')
url='https://github.com/thekhanj/ella'
conflicts=('ella')
provides=('ella')
license=('MIT')

_baseurl="${url}/releases/download/v${pkgver}"

sha256sums_x86_64=('335cbae035b2a53ff5d63c624ba0e51193efdd584f4e24aa9e41f731669236b3')
sha256sums_aarch64=('335cbae035b2a53ff5d63c624ba0e51193efdd584f4e24aa9e41f731669236b3')
sha256sums_armv7h=('335cbae035b2a53ff5d63c624ba0e51193efdd584f4e24aa9e41f731669236b3')
sha256sums_armv6h=('335cbae035b2a53ff5d63c624ba0e51193efdd584f4e24aa9e41f731669236b3')
sha256sums_armv6l=('335cbae035b2a53ff5d63c624ba0e51193efdd584f4e24aa9e41f731669236b3')
sha256sums_riscv64=('335cbae035b2a53ff5d63c624ba0e51193efdd584f4e24aa9e41f731669236b3')

case "$CARCH" in
x86_64) _binname="ella_v${pkgver}_linux_amd64" ;;
aarch64) _binname="ella_v${pkgver}_linux_arm64" ;;
armv7h | armv6h) _binname="ella_v${pkgver}_linux_arm_hf" ;;
armv6l) _binname="ella_v${pkgver}_linux_arm" ;;
riscv64) _binname="ella_v${pkgver}_linux_riscv64" ;;
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
