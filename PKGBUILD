# Contributor: Mateusz Łukasik <mati75@linuxmint.pl>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=tinywm-git
pkgver=1.1.33.g9d05612
pkgrel=3
pkgdesc="A tiny window manager written in only ~50 lines of code"
arch=('i686' 'x86_64')
url="http://incise.org/tinywm.html"
license=('custom')
makedepends=('git')
provides=('tinywm')
conflicts=('tinywm')
depends=('libx11')
source=('git+https://github.com/mackstann/tinywm.git')
md5sums=('SKIP')
_gitname="tinywm"

pkgver() {
  cd "$_gitname"
  printf %s $(git describe --tags|tr - .)
}

build() {
  cd "$_gitname"
  make
}

package() {
  cd "$_gitname"
  install -D -m755 tinywm $pkgdir/usr/bin/tinywm
  install -D -m644 README $pkgdir/usr/share/licenses/$pkgname/LICENSE

}
