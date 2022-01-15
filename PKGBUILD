# Maintainer :		ethan_v2 $(tr +- .@ <<<'<ethan-ethanjmarshall+co+uk>')
# Upstream :		ethanv2 <https://github.com/ethanv2/podbit/>

pkgname=podbit
pkgver=1.3
pkgrel=1

pkgdesc='Podboat Improved: A podcast client for your terminal'
arch=('any')
url="https://github.com/ethanv2/$pkgname"
license=('GPL3')

depends=('mpv' 'ncurses')
optdepends=('newsboat: enqueue podcasts from RSS')
makedepends=('go')

source=("$pkgname-$pkgver.tgz::$url/archive/v$pkgver.tar.gz")
md5sums=('dc17f62b810d28ad1f776167f9d811ee')

package() {
	cd "$pkgname-$pkgver"
	make PREFIX=/usr MANPREFIX=/usr/share/man DESTDIR="$pkgdir" -s install
}
