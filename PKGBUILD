# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)

pkgname=secilc
pkgver=2.5
pkgrel=1
pkgdesc="SELinux Common Intermediate Language Compiler"
groups=('selinux')
arch=('i686' 'x86_64')
url='https://github.com/SELinuxProject/cil/wiki'
license=('GPL')
makedepends=('xmlto' 'docbook-xml' 'docbook-xsl')
depends=('libsepol>=2.5')
source=("https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20160223/${pkgname}-${pkgver}.tar.gz")
sha256sums=('4303d911c06ee5c207e00f778ca786c1a6efa2554a562f5d014dbc0d2f4cc4a4')

build() {
  cd "${pkgname}-${pkgver}"
  make all
}

check() {
  cd "${pkgname}-${pkgver}"
  make test
}

package(){
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
