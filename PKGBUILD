# Maintainer: Newb I the Newbd <czbd hostedon o2 halfacolon pl>
# Contributor: Jan de Groot <j...@archlinux.org>

pkgname=python2-gtksourceview2
pkgver=2.10.1
pkgrel=1
pkgdesc="Python 2 bindings for gtksourceview2"
arch=('x86_64')
license=('GPL')
conflicts=('pygtksourceview2')
provides=('pygtksourceview2')
depends=('gtksourceview2>=2.10.0' 'pygtk>=2.17.0')
makedepends=('intltool' 'pkg-config')
options=('!libtool')
url="http://www.gnome.org";
source=(http://ftp.gnome.org/pub/gnome/sources/pygtksourceview/2.10/pygtksourceview-${pkgver}.tar.bz2)
sha512sums=('6f8f35ba36cb26f256861ff7f14c3236cf566d6d02f3dea69f63844081caee969ad6288a2aa48d35d4eb542cda73da9d4bfe2cc57548ca15cd372011cab0276e')

build() {
    cd "${srcdir}/pygtksourceview-${pkgver}"
    PYTHON=python2 ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-static --disable-docs
    make
}

package() {
    cd "${srcdir}/pygtksourceview-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
