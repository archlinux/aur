# Maintainer: Jose Riha <jose 1711 gmail com>

pkgname=gesftpserver
_pkgname=sftpserver
pkgver=0.1
pkgrel=1
pkgdesc="Green End SFTP Server - experimental free SFTP server"
arch=('i686' 'x86_64')
url="http://www.greenend.org.uk/rjk/sftpserver/"
license=('GPL2')
depends=('glibc')
source=(http://www.greenend.org.uk/rjk/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
md5sums=('367e2e465e13a748ee8dfee974ca68fc')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
