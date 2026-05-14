# Maintainer: Shulhan <m.shulhan at gmail.com>
pkgname='hunspell-id-git'
pkgver=v2.2.r5.2adbeb0
pkgdesc='Indonesian hunspell dictionary.'
pkgrel=1
arch=('any')
url='https://kilabit.info/project/hunspell-id/'
license=('LGPL-3.0-only')
conflicts=('vim-spell-id')

makedepends=('git')
source=('hunspell-id::git+https://git.kilabit.info/hunspell-id')
#source=('hunspell-id::git+file:///home/ms/kilabit.info/_project/src/hunspell-id/')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "$srcdir/${pkgname%-git}"

	make DESTDIR="$pkgdir" install
}

## SPDX-License-Identifier: LGPL-3.0-only
## SPDX-FileCopyrightText: 2022 M. Shulhan <ms@kilabit.info>
