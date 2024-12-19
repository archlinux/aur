# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>
# Contributor: philomath <philomath868 AT gmail DOT com>
# Contributor: aksr <aksr at t-com dot me>

pkgname=xjobs
pkgver=20241010
pkgrel=1
pkgdesc="A utility like xargs, but with enhanced support for multiprocessor machines"
arch=('i686' 'x86_64')
url="http://www.maier-komor.de/xjobs.html"
license=('GPLv2')
depends=('glibc')
source=("http://www.maier-komor.de/xjobs/$pkgname-$pkgver.tgz")
md5sums=('e821eefc549c7083cedf2e6c7ddbd98b')
sha1sums=('82b9fc61282b7afa4e890813038c669e7783b557')
sha256sums=('985666fede9346abe034a0074d8ab03f19f518802eaa744dd339c4028e639f38')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

