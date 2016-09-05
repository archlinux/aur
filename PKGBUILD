# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Doug Newgard <scimmia at archlinux dot info>

pkgname=rage
pkgver=0.2.1
pkgrel=1
pkgdesc="Video Player based on EFL"
arch=('i686' 'x86_64')
url="https://www.enlightenment.org/about-rage"
license=('BSD')
depends=('efl')
source=("http://download.enlightenment.org/rel/apps/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('24514ab8d6e06f159d4a4eb4a3da80a569785014f2628610f00cdb5561589d76')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -d "${pkgdir}/usr/share/doc/${pkgname}/"
  install -m644 -t "${pkgdir}/usr/share/doc/${pkgname}/" "ChangeLog" "NEWS" "README"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "AUTHORS" "COPYING"
}
