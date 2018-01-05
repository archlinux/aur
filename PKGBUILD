# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=echat
pkgver=0.04beta1
pkgrel=5
pkgdesc="vypress compatible ncurses chat (can work without server)"
arch=('x86_64')
url="http://echat.deep.perm.ru/"
license=(GPL)
depends=(ncurses)
#url="http://www.vypress.com/products/chat/unix/"
#url="http://pupykins.googlepages.com/" - contains also improoved version (utf8 and some more features)
source=(http://echat.deep.perm.ru/files/echat-$pkgver.tar.gz{,.asc})
sha256sums=('935a49da8bbec402fc080bc81365cdc114e59a7af0528725da479beb205e8ad5'
            'SKIP')

build() {
  cd "$srcdir"/$pkgname-${pkgver}
  make
}

package() {
  cd "$srcdir"/$pkgname-${pkgver}
  install -D -m 0755 echat "$pkgdir"/usr/bin/echat
  install -D -m 0644 doc/echat.1 "$pkgdir"/usr/share/man/man1/echat.1
  install -D -m 0644 doc/.echatrc.sample "$pkgdir"/usr/share/echat/dot.echatrc.sample
}
