# Maintainer :		ethan_v2 $(tr +- .@ <<<'<ethan-ethanjmarshall+co+uk>')
# Upstream :		ejv2 <https://github.com/ethanv2/podbit/>

pkgname=podbit
pkgver=3.1
pkgrel=1

pkgdesc='Podboat Improved: A podcast client for your terminal'
arch=('any')
url="https://github.com/ejv2/$pkgname"
license=('GPL3')

depends=('mpv' 'ncurses')
optdepends=('newsboat: enqueue podcasts from RSS'
	    'yt-dlp: download podcasts from video sites'
	    'youtube-dl: download podcasts from video sites')
makedepends=('go')

source=("$pkgname-$pkgver.tgz::$url/archive/v$pkgver.tar.gz")
md5sums=('f16b33224436914f7af879be8fb7bc05')

package() {
	cd "$pkgname-$pkgver"
	make PREFIX=/usr MANPREFIX=/usr/share/man DESTDIR="$pkgdir" -s install
}
