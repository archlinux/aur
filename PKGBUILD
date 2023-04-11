# SPDX-License-Identifier: LGPL-2.1-or-later
#
# Copyright (c) 2021 Valve.
# Maintainer: Guilherme G. Piccoli <gpiccoli@igalia.com>

pkgname=kdumpst
pkgver=1.0
pkgrel=1
pkgdesc="kdumpst, a tool for collecting pstore/kdump logs."
arch=('any')
url="https://gitlab.freedesktop.org/gpiccoli/kdumpst"
license=('LGPL2.1')
install=kdumpst.install

source=("https://gitlab.freedesktop.org/gpiccoli/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('147bbd40be85f8820723328c5fd27796af96a9c5839b2d806d149e76c7bc30f3')

package() {
	depends=('dmidecode' 'kexec-tools' 'makedumpfile' 'zip' 'zstd')

	cd $pkgname-v$pkgver
	make install DESTDIR="${pkgdir}"
}
