# Maintainer: gulaghad <can6parmak at gmail dot com>
pkgname=pidgin-window_merge
pkgver=0.3
pkgrel=1
pkgdesc="Pidgin plugin that merges the Buddy List window with a conversation window."
url='https://github.com/dm0-/window_merge'
license=('GPL3')
depends=('pidgin')
arch=('i686' 'x86_64')
source=("https://github.com/downloads/dm0-/window_merge/window_merge-$pkgver.tar.gz")
md5sums=('f8cd52ea39cdd8eb618b2db2cc1ee1fe')

build() {
  cd ${srcdir}/window_merge-$pkgver
  ./configure
  make
}

package() {
  cd ${srcdir}/window_merge-$pkgver
  install -Dpm 755 .libs/window_merge.so ${pkgdir}/usr/lib/pidgin/window_merge.so
}
