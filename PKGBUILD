pkgname=offrss
pkgver=1.3
pkgrel=1
pkgdesc="offrss - Offline RSS reader"
url="http://vicerveza.homeunix.net/~viric/cgi-bin/offrss/doc/trunk/doc/home.wiki"
arch=('x86_64' 'i686')
license=('AGPLv3')
depends=('libmrss')
source=("http://vicerveza.homeunix.net/~viric/soft/offrss/${pkgname}-${pkgver}.tar.gz")
md5sums=('53cdfa605ab1673d8a769f7c01cdcc92')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PDF_CFLAGS= PDF_LDFLAGS= PDF_OBJECTS=
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 offrss "${pkgdir}/usr/bin/offrss"
}

