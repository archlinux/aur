# Maintainer: envolution

pkgname=llama.cpp-server-tray
pkgver=0.3
pkgrel=1
pkgdesc="Companion system tray app for llama.cpp-server-service"
arch=('any')
url="https://github.com/envolution/llama.cpp-server-tray"
license=('MIT')
depends=('pyside6' 'python')
options=(!strip !debug)
source=($pkgname-$pkgver::https://github.com/envolution/${pkgname}/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('2c38f03c72dcb4fbe0314130cc5462b3ea25ddf2a8a188cf178a0980aaf33160')

package() {
  cd $pkgname-$pkgver
  install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 llama_service_running.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/llama_service_running.png"
  install -Dm644 llama_service.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/llama_service.png"
  install -Dm755 llama.cpp-server-tray.desktop "$pkgdir/usr/share/applications/llama.cpp-server-tray.desktop"
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
# vim:set ts=2 sw=2 et:
