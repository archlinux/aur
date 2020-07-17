# Maintainer: Omar Roth <omarroth@protonmail.com>

pkgname=urbit
pkgver=0.10.7
pkgrel=1
pkgdesc="An operating function"
arch=('x86_64')
url="https://github.com/urbit/urbit"
license=('MIT')
depends=('libsigsegv' 'gmp' 'openssl' 'ncurses' 'curl' 'libuv' 'python')
conflicts=('urbit-git')
source=($pkgname-$pkgver.tgz::https://bootstrap.urbit.org/$pkgname-v$pkgver-linux64.tgz)
sha256sums=('5ef8cf4c533cbd27048091030e06611e78c62cd65c2199aefcbd12db761d1e22')

package() {
  msg2 'Installing...'
  install -d "$pkgdir/"{usr/bin,opt/urbit}
  cp $srcdir/$pkgname-v$pkgver-linux64/urbit $pkgdir/opt/$pkgname/urbit
  cp $srcdir/$pkgname-v$pkgver-linux64/urbit-worker $pkgdir/opt/$pkgname/urbit-worker
  cp -R $srcdir/$pkgname-v$pkgver-linux64/urbit-terminfo $pkgdir/opt/$pkgname
  ln -s /opt/$pkgname/urbit $pkgdir/usr/bin/urbit
  ln -s /opt/$pkgname/urbit-worker $pkgdir/usr/bin/urbit-worker
}
