# Maintainer:  <zhaose@Erekir>
pkgname=guile-g-golf
_pkgname=g-golf
pkgver=0.8.0.rc.2
_pkgver=0.8.0-rc-2
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
sha256sums=('0b21c82c4c09e3f8736994f655bb72ee41210ad927701737b8d89e6f7f2b54e1'
            'SKIP')
sha256sum=()
validpgpkeys=('842265459B413377EEAC91DEF374FD93A3057AD7')

build() {
  cd "$srcdir/${_pkgname}-${_pkgver}"

  ./configure --prefix=/usr --with-guile-site=yes
  make
}

package() {
  cd "$srcdir/${_pkgname}-${_pkgver}"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
