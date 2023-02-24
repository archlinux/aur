# Maintainer: whoami <whoami@systemli.org>
# Contributor: Robert Holt <holt.r94 at gmail dot com>
# Contributor: Anton Larionov <diffident dot cat at gmail dot com>
# Contributor: Yorhel <projects@yorhel.nl>
# Contributor: archtux <antonio.arias99999@gmail.com>

pkgname=ncdc
pkgver=1.23.1
pkgrel=1
pkgdesc='Modern and lightweight direct connect client with a friendly ncurses interface'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='http://dev.yorhel.nl/ncdc'
license=('MIT')
depends=('gnutls' 'sqlite' 'glib2' 'libmaxminddb')
source=("http://dev.yorhel.nl/download/$pkgname-$pkgver.tar.gz"{,.asc})
validpgpkeys=('74460D32B80810EBA9AFA2E962394C698C2739FA') # Yoran Heling, only used for releases

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --with-geoip
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha512sums=(
	'9e38387ac816499c25a28bf70e548d560265c84d12b9bfd1701decea642c4ab33b3bb5ea9c015c3048e491f9f208c6c26a63d2ce722e831f84f703a6c9f2b86c'
	'SKIP'
)
