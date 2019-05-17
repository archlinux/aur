# Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: philomath <philomath868 AT gmail DOT com>
# Contributor: Roberto Alsina <ralsina@kde.org>
pkgname=skalibs
pkgver=2.8.1.0
pkgrel=1
pkgdesc="A general-purpose utility library for secure, small C development"
url="http://www.skarnet.org/software/skalibs/"
license=('ISC')
arch=('i686' 'x86_64')
depends=('glibc')
source=(http://www.skarnet.org/software/skalibs/$pkgname-$pkgver.tar.gz)
sha256sums=('431c6507b4a0f539b6463b4381b9b9153c86ad75fa3c6bfc9dc4722f00b166ba')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr \
              --datadir=/etc

  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make install DESTDIR=${pkgdir}
  install -D COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
