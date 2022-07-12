# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='kahlo'
pkgver='1.1.1'
pkgrel='1'
pkgdesc='Video download tool that automatically downloads newly posted videos from channels on supported websites'
arch=('any')
url="https://gitlab.com/dpeukert/$pkgname"
license=('GPL3')
depends=('python>=3.8.0')
optdepends=(
	'yt-dlp: at least one youtube-dl compatible module must be installed'
	'youtube-dl>=2020.11.21.1: at least one youtube-dl compatible module must be installed'
)
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('2cdb1f79e91e112a9d9a380cc9a68c9097e7122494a62a28c64bee612f77d636847866949e057f492d20d4d37483cc43627de243c6e4fb194810fbd4947b9440')

package() {
	cd "$srcdir/$pkgname-$pkgver/"
	make install DESTDIR="$pkgdir" PREFIX='/usr'
}
