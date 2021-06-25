# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Colin Pitrat <colin.pitrat@gmail.com>

pkgname=trophy
pkgver=2.0.4
pkgrel=1
pkgdesc="A 2D car racing action game with shooting and dropping bombs"
arch=('i686' 'x86_64')
url="http://trophy.sourceforge.net/"
license=('GPL')
depends=('clanlib10')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('b4a36cf5a6dd29ab848bd904e42281d4')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Install documentation
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 AUTHORS ChangeLog README TODO "${pkgdir}/usr/share/doc/${pkgname}"
}
