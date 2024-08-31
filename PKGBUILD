# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=foobar2000-component-playcount
pkgname=$_pkgname-bin
pkgver=3.1.5
pkgrel=1
pkgdesc="Collects playback statistics for your music"
arch=('any')
url="https://www.foobar2000.org/components/view/foo_playcount"
license=('unknown')
makedepends=('wget')
optdepends=('foobar2000>=1.6')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("foo_playcount.fb2k-component::$url")
b2sums=('611dec3e46e2bbb7b434266f22d9e3c623f1681dd4e7fb7afab817b0599b993682c10b585acbc2c7c8604ffea715ba97a3f78a561e271656d28d8f47e29e1c15')

# bypass dynamic download link
DLAGENTS=('https::/usr/bin/wget -nd -rl1 -A fb2k-component')

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/share/foobar2000/components foo_playcount.dll
}
