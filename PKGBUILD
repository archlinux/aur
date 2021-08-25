# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=foobar2000-component-playcount
pkgname=$_pkgname-bin
pkgver=3.0.4
pkgrel=1
pkgdesc="Collects playback statistics for your music"
arch=('any')
url="https://www.foobar2000.org/components/view/foo_playcount"
license=('unknown')
makedepends=('wget')
optdepends=('foobar2000>=1.4')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("Playback Statistics.fb2k-component::$url")
b2sums=('805105e27ed13421ee51980898d9a276d2d0515ef647866e381f53bbd0cb580789acd33eeaed8b30200799d8dd53fc8f41758f8bb5e33362d1380a1462e53a71')

# bypass dynamic download link
DLAGENTS=('https::/usr/bin/wget -nd -rl1 -A fb2k-component')

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/share/foobar2000/components foo_playcount.dll
}
