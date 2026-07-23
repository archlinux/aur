# Maintainer: Victor Coscrato <vcoscrato@gmail.com>
pkgname=tactica-bin
pkgver=r6.a73e682
pkgrel=1
pkgdesc="Desktop chess trainer built with Rust and Iced (prebuilt binary)"
arch=('x86_64')
url="https://github.com/vcoscrato/Tactica"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
provides=('tactica')
conflicts=('tactica')
source=(
  "$pkgname-$pkgver.tar.gz::$url/releases/download/${pkgver}/tactica-${pkgver}-x86_64.tar.gz"
)
sha256sums=(
  'SKIP'
)

package() {
  install -Dm0755 tactica-linux-x86_64 "$pkgdir/usr/bin/tactica"
  install -Dm0644 tactica.desktop "$pkgdir/usr/share/applications/tactica.desktop"
  install -Dm0644 tactica.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/tactica.svg"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  if [ -d legal ]; then
    install -Dm0644 legal/* "$pkgdir/usr/share/licenses/$pkgname/" 2>/dev/null || true
  fi
}
