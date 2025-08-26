# Maintainer: daneallenjohnson AT protonmail DOT com
pkgname=guile-g-golf
_pkgname=g-golf
pkgver=0.8.2
_pkgver=0.8.2
pkgrel=1
pkgdesc="A library for developing modern applications (GTK) in Guile Scheme."
arch=('x86_64')
url="https://www.gnu.org/software/g-golf/learn.html"
license=('LGPL')
depends=('guile' 'glib2' 'gobject-introspection' 'guile-lib')
makedepends=('autoconf' 'automake' 'texinfo')
optdepends=('gtk4: For using GTK-4 bindings'
	    'gtk3: For using GTK-3 bindings')
source=("http://ftp.gnu.org/gnu/${_pkgname}/${_pkgname}-${_pkgver}.tar.gz")
sha256sums=('7973be45c1c57248cfa2e5f5ac886b96fef5d97d212d3c77b3eb919ec2cd1d03')
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
