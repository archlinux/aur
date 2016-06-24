#!/bin/bash
# shellcheck disable=SC2034
# Maintainer: Alexandre Bouvier <contact at amb dot tf>
_pkgname=foobar2000-texttools
pkgname="$_pkgname-bin"
pkgver=1.0.5
pkgrel=1
pkgdesc="Adds customizable context menu commands for copying information about the selected tracks to clipboard"
arch=('any')
url="https://www.foobar2000.org/components/view/foo_texttools"
license=('unknown')
depends=('foobar2000')
makedepends=('wget')
source=("foo_texttools.zip::https://www.foobar2000.org/components/view/foo_texttools")
md5sums=('29f4b0ded57db27b806b0943ebb239bb')

# bypass dynamic download link
DLAGENTS=('https::/usr/bin/wget -nd -r -l 1 -A zip %u')

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir/usr/share/foobar2000/components" foo_texttools.dll
}
