pkgname=subberthehut
pkgver=17
pkgrel=1
pkgdesc='A command-line based OpenSubtitles.org downloader'
arch=('i686' 'x86_64')
url='https://github.com/mus65/subberthehut'
license=('GPL2')
depends=('xmlrpc-c' 'glib2' 'zlib')
makedepends=('bash-completion')
source=("https://github.com/mus65/$pkgname/archive/$pkgver.tar.gz")
md5sums=('a208bc658dce94d4b1696403a9d75e69')

build() {
	make -C "$pkgname-$pkgver"
}

package() {
	make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" PREFIX=/usr install
}
