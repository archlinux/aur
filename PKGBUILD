# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Jameson Pugh <imntreal@gmail.com>
# Contributor: Timothy Rice <t.rice@ms.unimelb.edu.au>

pkgname=direvent
pkgver=5.2
pkgrel=1
pkgdesc="Deamon that monitors events in the file system directories"
arch=('i686' 'x86_64')
url="https://www.gnu.org.ua/software/direvent/"
license=("GPL")
depends=('glibc')
source=("http://ftp.gnu.org/gnu/direvent/${pkgname}-${pkgver}.tar.gz")
sha256sums=('239822cdda9ecbbbc41a69181b34505b2d3badd4df5367e765a0ceb002883b55')

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
