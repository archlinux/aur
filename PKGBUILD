# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>
# Contributor: philomath <philomath868 AT gmail DOT com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=xjobs
pkgver=20151016
pkgrel=1
pkgdesc="A utility like xargs, but with enhanced support for multiprocessor machines"
arch=('i686' 'x86_64')
url="http://www.maier-komor.de/xjobs.html"
license=('GPLv2')
depends=('glibc')
source=("http://www.maier-komor.de/xjobs/$pkgname-$pkgver.tgz")
md5sums=('dba980fa3ee63181f7187eb62bd34411')
sha1sums=('d8ba23eb6a1cddedebd61efd92ed9d22a4b35c2d')
sha256sums=('1b80abe5effe057db21897f897842dccd76e7812c1caaa80f9b8e85cca409251')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

