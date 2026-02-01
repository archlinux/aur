# Maintainer: Haram Choi <altitudimen at google dot com>
pkgname=linux-fireface-mixer-bin
_pkgname=linux-fireface-mixer
pkgver=0.1.0
pkgrel=1
pkgdesc="GUI mixer application for RME Fireface 400 on Linux (Pre-compiled binary)"
arch=('x86_64')
url="https://github.com/oudeis01/linux-fireface-mixer"
license=('custom')
depends=('alsa-lib' 'libx11' 'libxrandr' 'libxinerama' 'libxcursor' 'libxi' 'systemd-libs')
optdepends=('snd-firewire-ctl-services: Required for hardware control')
provides=("$_pkgname")
conflicts=("$_pkgname")

source_x86_64=("totalmixer_gui-x86_64-$pkgver::${url}/releases/download/v${pkgver}/totalmixer_gui-x86_64"
               "totalmixer_cli-x86_64-$pkgver::${url}/releases/download/v${pkgver}/totalmixer_cli-x86_64")
source=("README-$pkgver.md::${url}/raw/v${pkgver}/README.md"
        "README-kr-$pkgver.md::${url}/raw/v${pkgver}/README-kr.md")

sha256sums=('23ed7e0ad3a436c18c1dcdf30f0303ae993e9b5bf311327eac11fcf64281fb53'
            '7f88edb8a01fbb148ef1b543b0b1012830d9e01935902c605936b12fb8382a18')
sha256sums_x86_64=('21a6937053d20d1d2b91d347fdf16fe42b6acad1e6904bcceb583814d34a33b0'
                   'ed479becdeb9caee09efc20f35557941f3daf6623215b1fc0eb90b3d61a4230a')

package() {
  install -Dm755 "$srcdir/totalmixer_gui-x86_64-$pkgver" "$pkgdir/usr/bin/totalmixer_gui"
  install -Dm755 "$srcdir/totalmixer_cli-x86_64-$pkgver" "$pkgdir/usr/bin/totalmixer_cli"
  
  install -Dm644 "$srcdir/README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/README-kr-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README-kr.md"
}
