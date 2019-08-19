# Maintainer: Omar Roth <omarroth@hotmail.com>

pkgname=urbit
pkgver=0.8.1
pkgrel=1
pkgdesc="An operating function"
arch=('x86_64')
url="https://github.com/urbit/urbit"
license=('MIT')
depends=('libsigsegv' 'gmp' 'openssl' 'ncurses' 'curl' 'libuv' 'python')
conflicts=('urbit-git')
source=($pkgname-$pkgver.tgz::https://bootstrap.urbit.org/urbit-linux64-v$pkgver.tgz)
sha256sums=('503c5dbaeae2dae504990dfb08eb687ae3fc75553978874e2179e8b1b29c5e7d')

package() {
  msg2 'Installing...'
  install -d "$pkgdir/"{usr/bin,opt/urbit}
  cp $srcdir/urbit $pkgdir/opt/$pkgname/urbit
  cp $srcdir/urbit-worker $pkgdir/opt/$pkgname/urbit-worker
  cp -R $srcdir/urbit-terminfo $pkgdir/opt/$pkgname
  ln -s /opt/$pkgname/urbit $pkgdir/usr/bin/$pkgname
}
