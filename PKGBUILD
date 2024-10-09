# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>
pkgname=sshexec
pkgver=1.1.1
pkgrel=1
pkgdesc="SSH wrapper that makes it easy to run commands directly in the SSH command"
arch=('x86_64')
url="https://codeberg.org/maandree/sshexec"
license=('custom:ISC')
depends=(openssh)
source=(sshexec-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=(34719e1d13a3d7e1065283ba42be7e31befb4f074c1749c2a7e29c3e575147ae)

build() {
  cd "${srcdir}/sshexec"
  make DESTDIR="${pkgdir}/" PREFIX=/usr
}

package() {
  cd "${srcdir}/sshexec"
  make DESTDIR="${pkgdir}/" PREFIX=/usr install
}
