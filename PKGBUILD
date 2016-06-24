#!/bin/bash
# shellcheck disable=SC2034
# Maintainer: Alexandre Bouvier <contact at amb dot tf>
_pkgname=foobar2000-playcount
pkgname="$_pkgname-bin"
pkgver=3.0.2
pkgrel=1
pkgdesc="Collects playback statistics for your music"
arch=('any')
url="https://www.foobar2000.org/components/view/foo_playcount"
license=('unknown')
depends=('foobar2000>=1.1.0')
makedepends=('wget')
source=("foo_playcount.fb2k-component::https://www.foobar2000.org/components/view/foo_playcount")
md5sums=('1699e277414cedf2def7df6c3f3f2e54')

# bypass dynamic download link
DLAGENTS=('https::/usr/bin/wget -nd -r -l 1 -A fb2k-component %u')

package() {
	install -Dm644 -t "${pkgdir:?}/usr/share/foobar2000/components" foo_playcount.dll
}
