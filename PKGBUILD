pkgname=zenith-theme-gtk
pkgver=1.0.1
pkgrel=1
pkgdesc="A refined dark theme with cohesive colors and complete UI coverage for GTK-based text editors."
arch=('any')
url="https://github.com/vmkspv/zenith-theme-gtk"
license=('MIT')
depends=('gtksourceview5')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2529c19a4e9195083a469af09b5f3852df45e3f0109981d7ffe8333e630e68dd')

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 gtksourceview-5/language-specs/* -t \
    "$pkgdir/usr/share/gtksourceview-5/language-specs/"
  install -Dm644 gtksourceview-5/styles/* -t \
    "$pkgdir/usr/share/gtksourceview-5/styles/"
  install -Dm644 org.gnome.Ptyxis/palettes/zenith.palette -t \
    "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
