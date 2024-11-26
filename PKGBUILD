# Maintainer: envolution

pkgname=llama.cpp-server-tray
pkgver=0.2
pkgrel=1
pkgdesc="Companion system tray app for llama.cpp-server-service"
arch=('any')
url="https://github.com/envolution/llama.cpp-server-tray"
license=('MIT')
depends=('pyside6' 'python')
options=(!strip !debug)
source=($pkgname-$pkgver::https://github.com/envolution/${pkgname}/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('7487bead33bd94aa06d68157bcca894eabcf8e1c757bb297a66d6a6db5749f48')

package() {
  cd $pkgname-$pkgver
  install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 llama_service_running.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/llama_service_running.png"
  install -Dm644 llama_service.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/llama_service.png"
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
# vim:set ts=2 sw=2 et:
