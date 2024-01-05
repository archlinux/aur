# SPDX-License-Identifier: LGPL-2.1-or-later
#
# Copyright (c) 2021 Valve.
# Maintainer: Guilherme G. Piccoli <gpiccoli@igalia.com>

pkgname=kdumpst
pkgver=1.1
pkgrel=1
pkgdesc="kdumpst, a tool for collecting pstore/kdump logs."
arch=('any')
url="https://gitlab.freedesktop.org/gpiccoli/kdumpst"
license=('LGPL2.1')
install=kdumpst.install

source=("https://gitlab.freedesktop.org/gpiccoli/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('3e50c563663b6d891af3a337e1b0c68d0d3765fbfae370a2a4fc3449f905d999')

package() {
	depends=('dmidecode' 'kexec-tools' 'makedumpfile' 'zip' 'zstd')

	cd $pkgname-v$pkgver
	make install DESTDIR="${pkgdir}"
}
