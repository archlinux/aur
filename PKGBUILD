# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=vmd.pl-git
pkgver=r35.d3ffee5
pkgrel=1
pkgdesc='Download music manager from vkontakte.ru'
arch=(any)
url='https://github.com/genaev/vmd'
license=(GPL2)
depends=(perl perl-vk-app perl-file-homedir perl-thread-pool-simple)
makedepends=(git)
source=(git://github.com/genaev/vmd
        hide-config-dir.diff)
sha1sums=('SKIP'
          'c8be3ca159cc99106ee06273af89a0733178819a')

pkgver() {
  cd vmd
  echo r$(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd vmd
  patch -p1 < "$srcdir/hide-config-dir.diff"
}

package() {
  cd vmd

  install -d "$pkgdir/usr/bin"
  install -m755 -t "$pkgdir/usr/bin" vmd.pl
}
