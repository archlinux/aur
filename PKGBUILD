pkgname=gtk-sharp-2-git
pkgver=2.12
pkgrel=1
pkgdesc="C# bindings for GTK+ 2, built from sources."
arch=('any')
url="https://mono-project.com/GtkSharp"
license=('GPL')
depends=('mono' 'gtk2' 'libglade')
provides=('gtk-sharp-2')
conflicts=('gtk-sharp-2')
source=("git://github.com/mono/gtk-sharp.git#branch=gtk-sharp-2-12-branch")
md5sums=('SKIP')

build() {
  cd "$srcdir/gtk-sharp"
  ./bootstrap-2.12 --prefix=/usr
  make
}

package() {
  cd "$srcdir/gtk-sharp"
  make DESTDIR="$pkgdir" install
}
