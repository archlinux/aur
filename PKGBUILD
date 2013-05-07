# Maintainer: Florian Dejonckheere <florian@floriandejonckheere.be>
# Contributor: goodmen <goodmenlinux@gmail.com>
# Contributor: Gergely Imreh <imrehgATgmailDOTcom>
# Originally contributed by champus, madeye, Ranguvar and ninja_pt

pkgname=ipmiutil
pkgver=2.8.7
pkgrel=1
pkgdesc="A simple program that lists results from the hardware detection library."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/ipmiutil/"
license=('BSD2.0')
depends=()
makedepends=('openssl')
options=('!emptydirs')
source=("http://prdownloads.sourceforge.net/ipmiutil/ipmiutil-${pkgver}.tar.gz")
md5sums=('a1686f1d09c4964c0fd7e8a40bb88cd3')
build() {
  cd ${srcdir}
  tar -xf ${pkgname}-${pkgver}.tar.gz

  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure  --enable-gpl
  make -j1 || return 1
  make DESTDIR=${pkgdir} install || return 1
}
