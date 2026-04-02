# Maintainer: Ersin Can Karaca <canersinkaraca@gmail.com>
pkgname=lapse-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Native screen recording application in Rust for Wayland/X11 (Pre-compiled binary)"
arch=('x86_64')
url="https://github.com/canersin/lapse"
license=('custom')
depends=('gtk3' 'wayland')
provides=("lapse")
conflicts=("lapse")

source=("https://github.com/canersin/lapse/releases/download/v${pkgver}/lapse-${pkgver}-x86_64.tar.gz")

sha256sums=('17b71f8e3e09bed7e080631f2cbf5988b922d578d4cada31b4cea9f75f478cd5')

package() {
  cd "lapse-${pkgver}"
  install -Dm755 "lapse" "$pkgdir/usr/bin/lapse"
  install -Dm644 "lapse.desktop" "$pkgdir/usr/share/applications/lapse.desktop"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "icon.png" "$pkgdir/usr/share/pixmaps/lapse.png"
  install -Dm644 "shutter.ogg" "$pkgdir/usr/share/sounds/lapse/shutter.ogg"
}
