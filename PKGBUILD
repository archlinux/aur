# Maintainer:  <zhaose@Erekir>
pkgname=guile-g-golf
_pkgname=g-golf
pkgver=0.8.0.a.4
_pkgver=0.8.0-a.4
pkgrel=1
pkgdesc="A library for developing modern applications (GTK) in Guile Scheme."
arch=('x86_64')
url="https://www.gnu.org/software/g-golf/learn.html"
license=('LGPL')
depends=('guile' 'glib2' 'gobject-introspection' 'guile-lib')
makedepends=('autoconf' 'automake' 'texinfo')
optdepends=('gtk4: For using GTK-4 bindings'
	    'gtk3: For using GTK-3 bindings'
	   )
source=("http://ftp.gnu.org/gnu/${_pkgname}/${_pkgname}-${_pkgver}.tar.gz"{,.sig})
sha256sums=('55521b9def9521b63aa2648ceca61aa9103d13b33063f369c946dae330cc65bb'
            'SKIP')
sha256sum=()
validpgpkeys=('842265459B413377EEAC91DEF374FD93A3057AD7')

build() {
  cd "$srcdir/${_pkgname}-${_pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${_pkgname}-${_pkgver}"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
