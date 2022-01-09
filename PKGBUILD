# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='kahlo'
pkgver='1.1.0'
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
sha512sums=('a3a781647642809e48615b2f0616594390c8f33f4e76bdc497ecf0709a9946fa606d535f23111aba6c4e03b0deb4e104affcc8bd930484e6689665305bd4760d')

package() {
	cd "$srcdir/$pkgname-$pkgver/"
	make install DESTDIR="$pkgdir" PREFIX='/usr'
}
