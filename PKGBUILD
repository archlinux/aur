# Maintainer: xsmile <sascha_r gmx de>

_pkgname=libtorrent
pkgname=libtorrent-ps
pkgver=0.13.6
pkgrel=1
pkgdesc='BitTorrent library written in C++'
url='https://github.com/rakshasa/libtorrent'
license=('GPL')
arch=('any')
depends=('openssl')
provides=('libtorrent')
conflicts=('libtorrent' 'libtorrent-git' 'libtorrent-ipv6' 'libtorrent-ps-git' 'libtorrent-pyro' 'libtorrent-pyro-git')
source=("https://github.com/rakshasa/$_pkgname/archive/$pkgver.tar.gz")
md5sums=('8c8eaa9fa03bd113967c68eea26493e7')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./autogen.sh
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --disable-debug \
    --disable-instrumentation
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
