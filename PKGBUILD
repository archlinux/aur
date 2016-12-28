pkgname=gtk-sharp-3-git
pkgver=3.22.1
pkgrel=1
pkgdesc="C# bindings for GTK+ 3, built from sources."
arch=('any')
url="https://github.com/openmedicus/gtk-sharp"
license=('GPL')
depends=('mono' 'gtk3')
provides=('gtk-sharp-3=3.22.1')
conflicts=('gtk-sharp-3')
source=("git://github.com/openmedicus/gtk-sharp.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/gtk-sharp"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/gtk-sharp"
  make DESTDIR="$pkgdir" install
}
