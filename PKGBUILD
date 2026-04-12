pkgname=inspectors-desktop-bin
_tag=v0.1.0-alpha.3
pkgver=0.1.0alpha3
pkgrel=1
pkgdesc='Prebuilt Linux-first Tauri operator app for the Agent Computer Use Platform'
arch=('x86_64')
url='https://github.com/OneNoted/inspectors'
license=('MIT')
options=('!strip')
depends=('glib-networking' 'gtk3' 'libsoup3' 'nodejs>=22' 'webkit2gtk-4.1')
provides=('inspectors-desktop')
conflicts=('inspectors-desktop' 'inspectors-desktop-git')
source=("$pkgname-$_tag-x86_64-unknown-linux-gnu.tar.gz::$url/releases/download/$_tag/$pkgname-$_tag-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('ff1b9e67d78c02344edf926571cfe800abf909d8fd68180d592f81fad0851885')

package() {
  cd "$srcdir/$pkgname-$_tag-x86_64-unknown-linux-gnu"
  install -Dm755 bin/inspectors-desktop "$pkgdir/usr/bin/inspectors-desktop"
  install -Dm644 share/applications/inspectors.desktop "$pkgdir/usr/share/applications/inspectors.desktop"
  install -Dm644 share/icons/hicolor/32x32/apps/inspectors.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/inspectors.png"
}
