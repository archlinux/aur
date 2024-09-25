# Maintainer: Mattias Andrée <`base64 -d`(bWF0dGlhcy5hbmRyZWU)@protonmail.com>
pkgname=sshexec
pkgver=1.1
pkgrel=1
pkgdesc="SSH wrapper that makes it easy to run commands directly in the SSH command"
arch=('x86_64')
url="https://codeberg.org/maandree/sshexec"
license=('custom:ISC')
depends=(openssh)
source=(sshexec-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=(5d925d47ceaaaef41b497b316eb5577bab9803a249bc6a70b010d7368591a916)

build() {
  cd "${srcdir}/sshexec"
  make DESTDIR="${pkgdir}/" PREFIX=/usr
}

package() {
  cd "${srcdir}/sshexec"
  make DESTDIR="${pkgdir}/" PREFIX=/usr install
}
