# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>
pkgname=sshexec
pkgver=1.0
pkgrel=1
pkgdesc="SSH wrapper that makes it easy to run commands directly in the SSH command"
arch=('x86_64')
url="https://codeberg.org/maandree/sshexec"
license=('custom:ISC')
depends=(openssh)
source=(sshexec-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=(946b7068a55d33cf16f07727ac50ec0cfa52245c0114cebbe355409700e631e4)

build() {
  cd "${srcdir}/sshexec"
  make DESTDIR="${pkgdir}/" PREFIX=/usr
}

package() {
  cd "${srcdir}/sshexec"
  make DESTDIR="${pkgdir}/" PREFIX=/usr install
}
