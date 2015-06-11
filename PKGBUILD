# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=wmcalendar
pkgver=0.5.2
pkgrel=1
pkgdesc="A calendar dock app"
url="http://sourceforge.net/projects/$pkgname/"
depends=('libxpm' 'libxext')
license=('GPL')
arch=('i686' 'x86_64')
depends=('libical' 'libxpm' 'gtk2')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz"
	buildfixes.patch)
md5sums=('4151430410d608bd68368f3c15de567b'
         'c3830611a7135813c4171e9e5a1b9a01')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}/Src"
  patch -Np3 -b -z .orig -i ../../buildfixes.patch
}
build() {
  cd "${srcdir}/${pkgname}-${pkgver}/Src"
  make
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}/Src"
  install -Dm0644 wmCalendar.1 "${pkgdir}/usr/share/man/man1/wmCalendar.1"
  install -Dm0755 wmCalendar "${pkgdir}/usr/bin/wmCalendar"
}

