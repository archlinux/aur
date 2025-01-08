# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Jameson Pugh <imntreal@gmail.com>
# Contributor: Timothy Rice <t.rice@ms.unimelb.edu.au>

pkgname=direvent
pkgver=5.4
pkgrel=1
pkgdesc="Deamon that monitors events in the file system directories"
arch=('i686' 'x86_64')
url="https://www.gnu.org.ua/software/direvent/"
license=("GPL-3.0-or-later")
depends=('glibc')
source=("http://ftp.gnu.org/gnu/direvent/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha256sums=('1dbbc6192aab67e345725148603d570c6a2828380c964215762af91524d795ba'
            'SKIP')
validpgpkeys=('325F650C4C2B6AD58807327A3602B07F55D0C732')
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
