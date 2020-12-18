# Maintainer: Omar Roth <omarroth@protonmail.com>

pkgname=urbit
pkgver=1.0
pkgrel=1
pkgdesc="An operating function"
arch=('x86_64')
url="https://github.com/urbit/urbit"
license=('MIT')
depends=('libsigsegv' 'gmp' 'openssl' 'ncurses' 'curl' 'libuv' 'python')
conflicts=('urbit-git')
source=($pkgname-$pkgver.tgz::https://bootstrap.urbit.org/$pkgname-v$pkgver-linux64.tgz)
sha256sums=('fe202106ccefec0167a0cb3ae787c907aa1abe4854f5cd6845661eae6676b844')

package() {
  msg2 'Installing...'
  install -d "$pkgdir/"{usr/bin,opt/urbit}
  cp $srcdir/$pkgname-v$pkgver-$arch-linux/urbit $pkgdir/opt/$pkgname/urbit
  cp $srcdir/$pkgname-v$pkgver-$arch-linux/urbit-worker $pkgdir/opt/$pkgname/urbit-worker
  ln -s /opt/$pkgname/urbit $pkgdir/usr/bin/urbit
  ln -s /opt/$pkgname/urbit-worker $pkgdir/usr/bin/urbit-worker
}
