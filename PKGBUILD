# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Josh VanderLinden <arch@cloudlery.com>
pkgname=s6
pkgver=2.7.1.1
pkgrel=1
pkgdesc="A small suite of programs for UNIX, designed to allow process supervision"
arch=('x86_64')
url="http://skarnet.org/software/${pkgname}/"
license=('ISC')
depends=('skalibs' 'execline-no-conflicts')
source=("http://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f37547f2890eb50bcb4cd46ffa38bad5ec9e6fd6bc7b73a8df0bdf0cf11f01a9')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --bindir=/usr/bin --sbindir=/usr/bin

  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  DESTDIR=${pkgdir} make install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
