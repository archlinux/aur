# Maintainer: AnrokX <192667251+AnrokX@users.noreply.github.com>
pkgname=snipland
pkgver=0.1.0
pkgrel=1
pkgdesc="The Windows 11 Snipping Tool, rebuilt for Hyprland"
arch=('any')
url="https://github.com/AnrokX/snipland"
license=('MIT')
depends=('hyprland' 'gtk4' 'gtk4-layer-shell' 'python' 'python-gobject'
         'python-cairo' 'grim' 'wl-clipboard' 'gpu-screen-recorder' 'ffmpeg'
         'libnotify')
optdepends=('python-evdev: click ripple / keystroke visualizer during recording')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6b8cfddcf77928d7105811b6114c5aa659943a6b46e301710186b082fb46d1f1')

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir/usr/share/$pkgname/snipland"
  install -m644 snipland/*.py snipland/style.css "$pkgdir/usr/share/$pkgname/snipland/"
  install -Dm755 snip "$pkgdir/usr/share/$pkgname/snip"
  install -d "$pkgdir/usr/bin"
  ln -s "/usr/share/$pkgname/snip" "$pkgdir/usr/bin/snipland"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
