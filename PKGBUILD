# Maintainer: Haram Choi <altitudinem at google dot com>
pkgname=linux-fireface-mixer-bin
_pkgname=linux-fireface-mixer
pkgver=0.1.0
pkgrel=2
pkgdesc="GUI mixer application for RME Fireface 400 on Linux (Pre-compiled binary)"
arch=('x86_64')
url="https://github.com/oudeis01/linux-fireface-mixer"
license=('GPL3')
depends=('alsa-lib' 'libx11' 'libxrandr' 'libxinerama' 'libxcursor' 'libxi' 'systemd-libs' 'snd-firewire-ctl-services')
optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")

source_x86_64=("totalmixer_gui-x86_64-$pkgver::${url}/releases/download/v${pkgver}/totalmixer_gui-x86_64"
               "totalmixer_cli-x86_64-$pkgver::${url}/releases/download/v${pkgver}/totalmixer_cli-x86_64")
source=("LICENSE-$pkgver::${url}/raw/v${pkgver}/LICENSE"
        "README-$pkgver.md::${url}/raw/v${pkgver}/README.md"
        "README-kr-$pkgver.md::${url}/raw/v${pkgver}/README-kr.md")

sha256sums=('SKIP' 'SKIP' 'SKIP')
sha256sums_x86_64=('SKIP' 'SKIP')

package() {
  install -Dm755 "$srcdir/totalmixer_gui-x86_64-$pkgver" "$pkgdir/usr/bin/totalmixer_gui"
  install -Dm755 "$srcdir/totalmixer_cli-x86_64-$pkgver" "$pkgdir/usr/bin/totalmixer_cli"
  
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/README-kr-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README-kr.md"
}
