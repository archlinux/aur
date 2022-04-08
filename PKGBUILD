# Maintainer :		ethan_v2 $(tr +- .@ <<<'<ethan-ethanjmarshall+co+uk>')
# Upstream :		ethanv2 <https://github.com/ethanv2/podbit/>

pkgname=podbit
pkgver=2.0.1
pkgrel=1

pkgdesc='Podboat Improved: A podcast client for your terminal'
arch=('any')
url="https://github.com/ethanv2/$pkgname"
license=('GPL3')

depends=('mpv' 'ncurses')
optdepends=('newsboat: enqueue podcasts from RSS'
	    'yt-dlp: download podcasts from video sites'
	    'youtube-dl: download podcasts from video sites')
makedepends=('go')

source=("$pkgname-$pkgver.tgz::$url/archive/v$pkgver.tar.gz")
md5sums=('5426690e326b29a7879bd56c1c235fde')

package() {
	cd "$pkgname-$pkgver"
	make PREFIX=/usr MANPREFIX=/usr/share/man DESTDIR="$pkgdir" -s install
}
