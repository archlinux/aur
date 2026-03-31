# Maintainer: Haram Choi <altitudinem at google dot com>
pkgname=linux-fireface-mixer-bin
_pkgname=linux-fireface-mixer
pkgver=0.1.1
pkgrel=1
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

sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'cb28ba022a322a743c0b66184ee62303508085427d717f64237293598ceb0958'
            '9383df6c98027194c5903466745c2568e034a75979b5eedcabebe7dd55ac69bc')
sha256sums_x86_64=('0f6e583b2e84a8f7b59477f0dbbd30e181df5846792330ed6fb3b40f9137584f'
                   '59f0129bcd9f219cef9b9093bf8079bc0a3eb343179cbcb2b0336eb700cb2378')

package() {
  install -Dm755 "$srcdir/totalmixer_gui-x86_64-$pkgver" "$pkgdir/usr/bin/totalmixer_gui"
  install -Dm755 "$srcdir/totalmixer_cli-x86_64-$pkgver" "$pkgdir/usr/bin/totalmixer_cli"
  
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/README-kr-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README-kr.md"
}
