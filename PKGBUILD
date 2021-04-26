# Contributor: Tom K <tomk@runbox.com>
# Contributor: Leonardo A. Gallego <leonardo@archlinux-es.org>
# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=chgrep
pkgver=1.2.5
pkgrel=1
pkgdesc="Fast pattern replacement utility, grep style"
depends=('glibc')
source=(https://github.com/jose1711/chgrep/archive/refs/tags/${pkgver}.tar.gz)
md5sums=('ff3637163e9dde1994029595bef65186')
url="https://github.com/jose1711/chgrep"
license=("GPL")
arch=('x86_64' 'i686')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
