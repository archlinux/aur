# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=telegram-purple
pkgver=0.7.0a
_pkgver=v0.7.0a
pkgrel=2
pkgdesc="Adds support for Telegram to Pidgin, Adium, Finch and other Libpurple based messengers."
arch=('i686' 'x86_64')
url="https://github.com/majn/telegram-purple"
license=("GPL")
makedepends=("git")
depends=('glib2' 'openssl' 'libpurple' 'zlib')
source=("git+https://github.com/majn/telegram-purple.git")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"
  git submodule update --init --recursive
  git checkout $_pkgver
}

build() {
  cd "${srcdir}/${pkgname}"
  ./configure
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="$pkgdir" install
}

