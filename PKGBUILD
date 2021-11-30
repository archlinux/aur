pkgname=feedbin-git
_pkgname=feedbin
pkgver=2021.11.17
pkgrel=1
pkgdesc='A nice place to read on the web'
arch=('x86_64')
url='https://feedbin.com/'
license=('MIT')
provides=('feedbin')
conflicts=('feedbin')
depends=('ruby2.6' 'ruby2.6-bundler' 'postgresql' 'redis' 'memcached' 'elasticsearch')
makedepends=('git')
source=("git+https://github.com/feedbin/feedbin.git")
sha256sums=('SKIP')

build() {
	cd $srcdir/$_pkgname
	sudo bundle-2.6
}


package() {
	mkdir -p $pkgdir/usr/share/webapps/$_pkgname
	cp -r $srcdir/$_pkgname/* $pkgdir/usr/share/webapps/$_pkgname
}


