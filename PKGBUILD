# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=foobar2000-component-texttools
pkgname=$_pkgname-bin
pkgver=1.0.5
pkgrel=2
pkgdesc="Adds customizable context menu commands for copying information about the selected tracks to clipboard"
arch=('any')
url="https://www.foobar2000.org/components/view/foo_texttools"
license=('unknown')
makedepends=('wget')
optdepends=('foobar2000')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("foo_texttools.zip::$url")
b2sums=('11ad99e58925f6c5f2e9fe009e54e27752e18ae859158fa85f0b2e3b13a32c045722c9431f43390dde688065ddd494ada89aee3ac384aff09c55439a39546110')

# bypass dynamic download link
DLAGENTS=('https::/usr/bin/wget -nd -rl1 -A zip')

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/share/foobar2000/components foo_texttools.dll
}
