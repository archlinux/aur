pkgname=zenith-theme-gtk
pkgver=1.0.0
pkgrel=1
pkgdesc="A refined dark theme with cohesive colors and complete UI coverage for GTK-based text editors."
arch=('any')
url="https://github.com/vmkspv/zenith-theme-gtk"
license=('MIT')
depends=('gtksourceview5')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e0376fd1586e302bf028a26c44b3af053b8efd2519a26f392157d0673bbbf5ed')

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 gtksourceview-5/language-specs/* -t \
    "$pkgdir/usr/share/gtksourceview-5/language-specs/"
  install -Dm644 gtksourceview-5/styles/* -t \
    "$pkgdir/usr/share/gtksourceview-5/styles/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
