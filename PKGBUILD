# SPDX-License-Identifier: LGPL-2.1-or-later
#
# Copyright (c) 2021 Valve.
# Maintainer: Guilherme G. Piccoli <gpiccoli@igalia.com>

pkgname=kdumpst
pkgver=1.4
pkgrel=1
pkgdesc="kdumpst, a tool for collecting pstore/kdump logs."
arch=('any')
url="https://gitlab.freedesktop.org/gpiccoli/kdumpst"
license=('LGPL2.1')
install=kdumpst.install

source=("https://gitlab.freedesktop.org/gpiccoli/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('b5d16f72341e4430a7d427458b576b0daf7f300546847346451da8185a01dcbf')

package() {
	depends=('dmidecode' 'kexec-tools' 'makedumpfile' 'zip' 'zstd')

	cd $pkgname-v$pkgver
	make install DESTDIR="${pkgdir}"
}
