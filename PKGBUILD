# Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: philomath <philomath868 AT gmail DOT com>
# Contributor: Roberto Alsina <ralsina@kde.org>
pkgname=skalibs
pkgver=2.13.1.0
pkgrel=1
pkgdesc="A general-purpose utility library for secure, small C development"
url="http://www.skarnet.org/software/skalibs/"
license=('ISC')
arch=('i686' 'x86_64')
depends=('glibc')
source=(http://www.skarnet.org/software/skalibs/$pkgname-$pkgver.tar.gz)
sha256sums=('b3c48938c7fba4b19a8b0dce6e7a11427717a0901160bb62cfc6823f8ac86d92')

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
