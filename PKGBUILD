# Maintainer: 3ED_0 <krzysztof1987 at gamil.com>
# Contributor: Roman Kyrylych <roman@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=eiciel
pkgver=0.9.13
pkgrel=1
pkgdesc="GNOME file ACL editor"
arch=('i686' 'x86_64')
url="http://rofi.roger-ferrer.org/eiciel/"
license=('GPL')
depends=('acl' 'gtkmm3' 'nautilus' 'desktop-file-utils')
makedepends=('git')
options=('!libtool')
source=(${pkgname}::git+https://github.com/rofirrim/${pkgname}.git#tag=${pkgver})
sha512sums=('SKIP')


prepare() {
	cd "${srcdir}/${pkgname}"
	autoreconf -vif
}

build() {
  cd "${srcdir}/${pkgname}"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}
