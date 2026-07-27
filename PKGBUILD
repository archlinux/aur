# Maintainer: Remco Stoeten <stoetenremco.rs@gmail.com>

pkgname=dora
pkgver=0.38.0
pkgrel=1
pkgdesc='Dora desktop database client (prebuilt binary release)'
arch=('x86_64')
url='https://github.com/remcostoeten/dora'
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator' 'openssl' 'libsoup3')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/remcostoeten/dora/releases/download/v${pkgver}/dora-x86_64-unknown-linux-gnu.tar.gz"
)
sha256sums=('74dc6b8b40070e3a07208f8ab372cd1e1da536b8ae5b3175021a8bc8deb2d715')

package() {
  cd "$srcdir/dora-x86_64-unknown-linux-gnu"

  install -Dm755 dora "$pkgdir/usr/bin/dora"

  if [[ -f dora.desktop ]]; then
    install -Dm644 dora.desktop "$pkgdir/usr/share/applications/dora.desktop"
  fi

  if [[ -f icons/32x32.png ]]; then
    install -Dm644 icons/32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/dora.png"
  fi

  if [[ -f icons/128x128.png ]]; then
    install -Dm644 icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/dora.png"
  fi
}
