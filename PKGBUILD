pkgname=gtk-sharp-3-git
pkgver=2.99.4
pkgrel=1
pkgdesc="C# bindings for GTK+ 3, built from sources."
arch=('any')
url="https://mono-project.com/GtkSharp"
license=('GPL')
depends=('mono' 'gtk3')
provides=('gtk-sharp-3')
conflicts=('gtk-sharp-3')
source=("git://github.com/mono/gtk-sharp.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/gtk-sharp"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/gtk-sharp"
  make DESTDIR="$pkgdir" install
}
