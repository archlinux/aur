# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)

pkgname=secilc
pkgver=2.6
pkgrel=1
pkgdesc="SELinux Common Intermediate Language Compiler"
groups=('selinux')
arch=('i686' 'x86_64')
url='https://github.com/SELinuxProject/cil/wiki'
license=('GPL')
makedepends=('xmlto' 'docbook-xml' 'docbook-xsl')
depends=('libsepol>=2.6')
source=("https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20161014/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a84838c15bb7b0141238b48294b15ff0e1618107f547541a0067d1ddabcc9502')

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
