# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=telegram-purple
pkgver=1.4.6
pkgrel=1
pkgdesc="Adds support for Telegram to Pidgin, Adium, Finch and other Libpurple based messengers."
arch=('i686' 'x86_64')
url="https://github.com/majn/telegram-purple"
license=("GPL")
makedepends=("git")
depends=('glib2' 'libgcrypt>=1.6.0' 'libpurple' 'zlib' 'libwebp')
conflicts=('telegram-purple-git')
source=("https://github.com/majn/${pkgname}/releases/download/v${pkgver}/telegram-purple_${pkgver}.orig.tar.gz")
sha256sums=('68f97a170611f0030b426f9772c382eb4cee9381d24ca32ab254efd0b7970d1b')

build() {
  cd "${srcdir}/${pkgname}"
  ./configure --prefix=/usr CFLAGS="$CFLAGS -w"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="$pkgdir" install
}
