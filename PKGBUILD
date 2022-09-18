# Maintainer: Shulhan <m.shulhan at gmail.com>
pkgname='hunspell-id-git'
pkgver=v2.2.r5.2adbeb0
pkgdesc='Indonesian hunspell dictionary.'
pkgrel=1
arch=('any')
url='https://github.com/shuLhan/hunspell-id'
license=('LGPL3')
conflicts=('vim-spell-id')

makedepends=('git')
source=('hunspell-id::git+https://github.com/shuLhan/hunspell-id.git')
#source=('hunspell-id::git+file:///home/ms/src/hunspell-id')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "$srcdir/${pkgname%-git}"

	make DESTDIR="$pkgdir" install
}

## SPDX-FileCopyrightText: 2022 M. Shulhan <ms@kilabit.info>
## SPDX-License-Identifier: LGPL-3.0-only
