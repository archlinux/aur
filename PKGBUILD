# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=telegram-purple
pkgver=1.2.6
pkgrel=2
pkgdesc="Adds support for Telegram to Pidgin, Adium, Finch and other Libpurple based messengers."
arch=('i686' 'x86_64')
url="https://github.com/majn/telegram-purple"
license=("GPL")
makedepends=("git")
depends=('glib2' 'libgcrypt>=1.6.0' 'libpurple' 'zlib' 'libwebp')
conflict=('telegram-purple-git')
source=("https://github.com/majn/${pkgname}/releases/download/v${pkgver}/telegram-purple_${pkgver}.orig.tar.gz")
sha256sums=('f643d56da0c2ab4ffe603542e3a485cd10d45936d8f6e7dfafec862aa81f2dbb')

build() {
  cd "${srcdir}/${pkgname}"
  ./configure
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="$pkgdir" install
}
