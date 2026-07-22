# SPDX-License-Identifier: LGPL-2.1-or-later
#
# Copyright (c) 2021 Valve.
# Maintainer: Guilherme G. Piccoli <gpiccoli@igalia.com>

pkgname=kdumpst
pkgver=1.3
pkgrel=1
pkgdesc="kdumpst, a tool for collecting pstore/kdump logs."
arch=('any')
url="https://gitlab.freedesktop.org/gpiccoli/kdumpst"
license=('LGPL2.1')
install=kdumpst.install

source=("https://gitlab.freedesktop.org/gpiccoli/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('6b6eb2e68dfa22378511c41d0951d973208585aec48bc242a8beb8141055a2dd')

package() {
	depends=('dmidecode' 'kexec-tools' 'makedumpfile' 'zip' 'zstd')

	cd $pkgname-v$pkgver
	make install DESTDIR="${pkgdir}"
}
