# Maintainer: Mike Pento <mpento@darkforge.net>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Doug Newgard <scimmia at archlinux dot info>

pkgname=enventor
pkgver=1.0.99
pkgrel=1
pkgdesc="Editor for EDC files (edje/efl)"
arch=('i686' 'x86_64')
url="https://git.enlightenment.org/enlightenment/enventor"
license=('BSD')
depends=('efl')
source=(git+https://git.enlightenment.org/enlightenment/${pkgname}.git)
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  ./autogen.sh --prefix=/usr --disable-statc
  make
}

package() {
  cd "${srcdir}/${pkgname}"

  make DESTDIR="${pkgdir}" install

  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "AUTHORS" "COPYING"
}
