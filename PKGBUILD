# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: pressh

pkgname=libggimisc
pkgver=2.2.2
pkgrel=1
pkgdesc="GGI assorted features"
arch=('i686' 'x86_64')
url="http://ibiblio.org/ggicore/packages/libggimisc.html"
license=("MIT")
groups=('ggi')
depends=('libggi')
source=("http://downloads.sourceforge.net/project/ggi/lowlevel/${pkgname}-${pkgver}/${pkgname}-${pkgver}.src.tar.gz")
md5sums=('84bab3e636009c530d7bf0ef1e395b3a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR=${pkgdir} install
  install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
