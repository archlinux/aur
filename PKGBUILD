pkgname=zenith-theme-gtk
pkgver=1.0.2
pkgrel=1
pkgdesc="A refined dark theme with cohesive colors and complete UI coverage for GTK-based text editors."
arch=('any')
url="https://github.com/vmkspv/zenith-theme-gtk"
license=('MIT')
depends=('gtksourceview5')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b7f9768cdcb15c6cc30d6a0cec7c8b54669ed016970c90feb34f1e70e7c5a82b')

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 gtksourceview-5/styles/* -t \
    "$pkgdir/usr/share/gtksourceview-5/styles/"
  install -Dm644 org.gnome.Ptyxis/palettes/zenith.palette -t \
    "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
