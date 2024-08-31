# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=foobar2000-component-texttools
pkgname=$_pkgname-bin
pkgver=1.1
pkgrel=1
pkgdesc="Adds customizable context menu commands for copying information about the selected tracks to clipboard"
arch=('any')
url="https://www.foobar2000.org/components/view/foo_texttools"
license=('unknown')
makedepends=('wget')
optdepends=('foobar2000>=1.6')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("foo_texttools.fb2k-component::$url")
b2sums=('97dbf3101f23181d5844ba486703b5e5a085f7f24014941af954cf85ce5b0789a03b331542c719385305cc296f67d27d078119a8256288b7ff7df6f7b7388567')

# bypass dynamic download link
DLAGENTS=('https::/usr/bin/wget -nd -rl1 -A fb2k-component')

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/share/foobar2000/components foo_texttools.dll
}
