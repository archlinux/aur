# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Jameson Pugh <imntreal@gmail.com>
# Contributor: Timothy Rice <t.rice@ms.unimelb.edu.au>

pkgname=direvent
pkgver=5.5
pkgrel=1
pkgdesc="Deamon that monitors events in the file system directories"
arch=('i686' 'x86_64')
url="https://www.gnu.org.ua/software/direvent/"
license=("GPL-3.0-or-later")
depends=('glibc')
source=("http://ftp.gnu.org/gnu/direvent/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha256sums=('0e16c0b4b3e6f7673e9b4f31d81ab01236ad22f83538512f3b2f58f9f96fdcb7'
            'SKIP')
validpgpkeys=('4BE4E62655488EB92ABB468F79FFD94BFCE230B1')
   # Sergey Poznyakoff <gray@gnu.org>
   # To validate, see instructions at:
   #   https://www.gnu.org.ua/software/direvent/download.html

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -k check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
}
