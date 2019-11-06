# Maintainer: Omar Roth <omarroth@protonmail.com>

pkgname=urbit
pkgver=0.9.2
pkgrel=1
pkgdesc="An operating function"
arch=('x86_64')
url="https://github.com/urbit/urbit"
license=('MIT')
depends=('libsigsegv' 'gmp' 'openssl' 'ncurses' 'curl' 'libuv' 'python')
conflicts=('urbit-git')
source=($pkgname-$pkgver.tgz::https://bootstrap.urbit.org/urbit-linux64-v$pkgver.tgz)
sha256sums=('d867db4b4c961966abed92ea04acceb57f7b4e198a566b70b231f46b7cef74cc')

package() {
  msg2 'Installing...'
  install -d "$pkgdir/"{usr/bin,opt/urbit}
  cp $srcdir/urbit $pkgdir/opt/$pkgname/urbit
  cp $srcdir/urbit-worker $pkgdir/opt/$pkgname/urbit-worker
  cp -R $srcdir/urbit-terminfo $pkgdir/opt/$pkgname
  ln -s /opt/$pkgname/urbit $pkgdir/usr/bin/$pkgname
}
