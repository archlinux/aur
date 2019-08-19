# Maintainer: Omar Roth <omarroth@protonmail.com>

pkgname=urbit
pkgver=0.8.2
pkgrel=1
pkgdesc="An operating function"
arch=('x86_64')
url="https://github.com/urbit/urbit"
license=('MIT')
depends=('libsigsegv' 'gmp' 'openssl' 'ncurses' 'curl' 'libuv' 'python')
conflicts=('urbit-git')
source=($pkgname-$pkgver.tgz::https://bootstrap.urbit.org/urbit-linux64-v$pkgver.tgz)
sha256sums=('9eca7de118cb1f80b180f23afc4e6edb8c61db62ebcad90f1fbf484d0d5c248e')

package() {
  msg2 'Installing...'
  install -d "$pkgdir/"{usr/bin,opt/urbit}
  cp $srcdir/urbit $pkgdir/opt/$pkgname/urbit
  cp $srcdir/urbit-worker $pkgdir/opt/$pkgname/urbit-worker
  cp -R $srcdir/urbit-terminfo $pkgdir/opt/$pkgname
  ln -s /opt/$pkgname/urbit $pkgdir/usr/bin/$pkgname
}
