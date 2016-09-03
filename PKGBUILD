# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Doug Newgard <scimmia at archlinux dot info>

pkgname=enventor
pkgver=1.0.0
pkgrel=1
pkgdesc="Editor for EDC files (edje/efl)"
arch=('i686' 'x86_64')
url="https://www.enlightenment.org/about-enventor"
license=('BSD')
depends=('efl')
source=("http://download.enlightenment.org/rel/apps/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('6756707381de81d3cd6c445f7735927aa4dc853afdb04354d5267078b32bd134')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --disable-static

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "AUTHORS" "COPYING"
}
