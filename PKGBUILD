# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=gss
pkgver=1.0.3
pkgrel=1
pkgdesc='GNU Generic Security Service'
url='https://www.gnu.org/software/gss/'
arch=('x86_64')
license=('GPL3')
source=("https://ftp.gnu.org/gnu/gss/gss-${pkgver}.tar.gz")
b2sums=('3f535fc152c72490a536b55dfdf175d6df6f4da7f9eb7454457d1e098763be604506006681f82d2d49325cb38e9a6f5454cb5b20462ff06b1b1084e79e95621e')

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
