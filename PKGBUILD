pkgname=subberthehut
pkgver=20
pkgrel=1
pkgdesc='A command-line based OpenSubtitles.org downloader'
arch=('i686' 'x86_64')
url='https://github.com/mus65/subberthehut'
license=('GPL2')
depends=('xmlrpc-c' 'glib2' 'zlib')
makedepends=('bash-completion')
source=("https://github.com/mus65/$pkgname/archive/$pkgver.tar.gz")
md5sums=('da16b3680f7d620d865fdfb5b7a2f5fa')

build() {
	make -C "$pkgname-$pkgver"
}

package() {
	make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" PREFIX=/usr install
}
