# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=gss
pkgver=1.0.4
pkgrel=1
pkgdesc='GNU Generic Security Service'
url='https://www.gnu.org/software/gss/'
arch=('x86_64')
license=('GPL3')
source=("https://ftp.gnu.org/gnu/gss/gss-${pkgver}.tar.gz"{,.sig})
b2sums=('fdcb59fa26c7bef917e2fd75bea58478b33342a516ecf80caeab5dfeebfeed80bbf87eec47415968dd0b326d10386237b167e7f6090066bc0ccf928f0ec53643'
        'SKIP')
validpgpkeys=('B1D2BD1375BECB784CF4F8C4D73CF638C53C06BE')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make -k check
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
