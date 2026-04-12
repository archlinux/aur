pkgname=inspectors-desktop-bin
_tag=v0.1.0-alpha.2
pkgver=0.1.0alpha2
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
sha256sums=('245a6d61d2870a9d00c752148a5a5a61bde14e45fd9945fca1818bed9459eaf2')

package() {
  cd "$srcdir/$pkgname-$_tag-x86_64-unknown-linux-gnu"
  install -Dm755 bin/inspectors-desktop "$pkgdir/usr/bin/inspectors-desktop"
  install -Dm644 share/applications/inspectors.desktop "$pkgdir/usr/share/applications/inspectors.desktop"
  install -Dm644 share/icons/hicolor/32x32/apps/inspectors.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/inspectors.png"
}
