# Maintainer: Omar Roth <omarroth@protonmail.com>

pkgname=urbit
pkgver=0.10.3
pkgrel=1
pkgdesc="An operating function"
arch=('x86_64')
url="https://github.com/urbit/urbit"
license=('MIT')
depends=('libsigsegv' 'gmp' 'openssl' 'ncurses' 'curl' 'libuv' 'python')
conflicts=('urbit-git')
source=($pkgname-$pkgver.tgz::https://bootstrap.urbit.org/$pkgname-linux64-v$pkgver.tgz)
sha256sums=('09244cf946bb21e0d7c2acf785ebdf8f1d806d3b3581c70b0ebbc9f3ba9fc4b5')

package() {
  msg2 'Installing...'
  install -d "$pkgdir/"{usr/bin,opt/urbit}
  cp $srcdir/$pkgname-linux64-v$pkgver/urbit $pkgdir/opt/$pkgname/urbit
  cp $srcdir/$pkgname-linux64-v$pkgver/urbit-worker $pkgdir/opt/$pkgname/urbit-worker
  cp -R $srcdir/$pkgname-linux64-v$pkgver/urbit-terminfo $pkgdir/opt/$pkgname
  ln -s /opt/$pkgname/urbit $pkgdir/usr/bin/urbit
  ln -s /opt/$pkgname/urbit-worker $pkgdir/usr/bin/urbit-worker
}
