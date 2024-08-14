# SPDX-License-Identifier: LGPL-2.1-or-later
#
# Copyright (c) 2021 Valve.
# Maintainer: Guilherme G. Piccoli <gpiccoli@igalia.com>

pkgname=kdumpst
pkgver=1.2
pkgrel=1
pkgdesc="kdumpst, a tool for collecting pstore/kdump logs."
arch=('any')
url="https://gitlab.freedesktop.org/gpiccoli/kdumpst"
license=('LGPL2.1')
install=kdumpst.install

source=("https://gitlab.freedesktop.org/gpiccoli/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('e623107293a737c7549e5723076f1094c16c98aeb63e2fa85e35a9d4062f7358')

package() {
	depends=('dmidecode' 'kexec-tools' 'makedumpfile' 'zip' 'zstd')

	cd $pkgname-v$pkgver
	make install DESTDIR="${pkgdir}"
}
