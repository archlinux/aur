# Maintainer: Omar Roth <omarroth@protonmail.com>

pkgname=urbit
pkgver=0.10.8
pkgrel=1
pkgdesc="An operating function"
arch=('x86_64')
url="https://github.com/urbit/urbit"
license=('MIT')
depends=('libsigsegv' 'gmp' 'openssl' 'ncurses' 'curl' 'libuv' 'python')
conflicts=('urbit-git')
source=($pkgname-$pkgver.tgz::https://bootstrap.urbit.org/$pkgname-v$pkgver-linux64.tgz)
sha256sums=('b477ed9a976ac7cbc8d4db530db0757a71c89e3454eab7d1b05802072294cfb5')

package() {
  msg2 'Installing...'
  install -d "$pkgdir/"{usr/bin,opt/urbit}
  cp $srcdir/$pkgname-v$pkgver-linux64/urbit $pkgdir/opt/$pkgname/urbit
  cp $srcdir/$pkgname-v$pkgver-linux64/urbit-king $pkgdir/opt/$pkgname/urbit-king
  cp $srcdir/$pkgname-v$pkgver-linux64/urbit-worker $pkgdir/opt/$pkgname/urbit-worker
  ln -s /opt/$pkgname/urbit $pkgdir/usr/bin/urbit
  ln -s /opt/$pkgname/urbit-king $pkgdir/usr/bin/urbit-king
  ln -s /opt/$pkgname/urbit-worker $pkgdir/usr/bin/urbit-worker
}
