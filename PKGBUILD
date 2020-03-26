# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=telegram-purple
pkgver=1.4.3
pkgrel=1
pkgdesc="Adds support for Telegram to Pidgin, Adium, Finch and other Libpurple based messengers."
arch=('i686' 'x86_64')
url="https://github.com/majn/telegram-purple"
license=("GPL")
makedepends=("git")
depends=('glib2' 'libgcrypt>=1.6.0' 'libpurple' 'zlib' 'libwebp')
conflicts=('telegram-purple-git')
source=("https://github.com/majn/${pkgname}/releases/download/v${pkgver}/telegram-purple_${pkgver}.orig.tar.gz")
sha256sums=('a8d91a0951453487315072b6ad0728ea846e4a75e40bbbc02047ad46cd000698')

build() {
  cd "${srcdir}/${pkgname}"
  ./configure --prefix=/usr CFLAGS="$CFLAGS -w"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="$pkgdir" install
}
