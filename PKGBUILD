# Maintainer: Andy Kluger <AndyKluger@mailfence.com>
# Contributor: philomath <philomath868 AT gmail DOT com>
# Contributor: Roberto Alsina <ralsina@kde.org>
pkgname=skalibs
pkgver=2.15.0.0
pkgrel=1
pkgdesc="A general-purpose utility library for secure, small C development"
url="http://www.skarnet.org/software/skalibs/"
license=('ISC')
arch=('i686' 'x86_64')
depends=('glibc')
options=('!lto')
source=(http://www.skarnet.org/software/skalibs/$pkgname-$pkgver.tar.gz)
sha256sums=('7fde96e8afb4191593a15328883e9c7726c96891cf071222146821e8c87f8007')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --datadir=/etc
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make install DESTDIR=${pkgdir}
  install -D COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
