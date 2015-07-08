# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=libtimezonemap
pkgver=0.4.1
pkgrel=1
pkgdesc="GTK+3 timezone map widget"
arch=('i686' 'x86_64')
url="https://launchpad.net/libtimezonemap"
license=('GPL')
groups=('unity')
depends=('gtk3' 'json-glib')
makedepends=('gobject-introspection' 'intltool')
options=('!libtool')
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}.tar.gz")
sha512sums=('25a72747e8a81d1afddad007599f188ee7435240e17f431f28f4fe2b6f4c777c9a999d5eeb8d66bde4c8f0a7495f3dae38f5f47fb1b82896a0602e779670ad87')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf -vfi
  ./configure --prefix=/usr --enable-introspection --with-gtk=3
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
