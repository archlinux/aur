# Maintainer: Omar Roth <omarroth@protonmail.com>

pkgname=urbit
pkgver=0.10.1
pkgrel=1
pkgdesc="An operating function"
arch=('x86_64')
url="https://github.com/urbit/urbit"
license=('MIT')
depends=('libsigsegv' 'gmp' 'openssl' 'ncurses' 'curl' 'libuv' 'python')
conflicts=('urbit-git')
source=($pkgname-$pkgver.tgz::https://bootstrap.urbit.org/urbit-linux64-v$pkgver.tgz)
sha256sums=('4ef0ea7bbeb60c162c837e02189237d59ba870d469c5090629fd84fdece7a442')

package() {
  msg2 'Installing...'
  install -d "$pkgdir/"{usr/bin,opt/urbit}
  cp $srcdir/urbit $pkgdir/opt/$pkgname/urbit
  cp $srcdir/urbit-worker $pkgdir/opt/$pkgname/urbit-worker
  cp -R $srcdir/urbit-terminfo $pkgdir/opt/$pkgname
  ln -s /opt/$pkgname/urbit $pkgdir/usr/bin/$pkgname
}
