# Maintainer: JSH <jsh6789 at gmail dot com>
# Contributor: Peter Lewis <pete@muddygoat.org>
# Contributor: Bartlomiej Palmowski (Rotwang), maks1k at wp dot pl
# Contributor: Łukasz Fidosz (virhilo), virhilo at gmail dot com

pkgname=tornado
pkgver=1.4
pkgrel=4
pkgdesc="Clone of a C64 game, the goal is to destroy the opponent's house with certain weather phenomena"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/kouya/tornado"
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
depends=('ncurses')
optdepends=('wget: for submitting highscores online')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr tornado tornado.6
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m 0644 doc/man/tornado.6 "$pkgdir/usr/share/man/man6/tornado.6"
  install -D -m 0755 tornado "$pkgdir/usr/bin/tornado"
}

sha256sums=('0f0a0563ed1831eac46a2c93f67a60fd43eb53a3aea3327b544533742003c5f0')
