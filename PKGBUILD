# Maintainer: tippkraft <impressum@tippkraft.com>
pkgname=tippkraft-bin
pkgver=0.1.25
pkgrel=1
options=('!debug' '!strip')
pkgdesc='Text expander for Linux on Wayland and X11 (desktop client, snippets sync through a tippkraft account)'
arch=('x86_64')
url='https://tippkraft.com'
license=('MIT')
depends=('libxkbcommon' 'gcc-libs' 'glibc')
provides=('tippkraft')
conflicts=('tippkraft')
install=tippkraft.install
source=("tippkraft-$pkgver::https://github.com/emmgeede/tippkraft-desktop/releases/download/v$pkgver/tippkraft-x86_64-linux"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/emmgeede/tippkraft-desktop/v$pkgver/LICENSE"
        "60-tippkraft-uinput.rules")
sha256sums=('50ddd82eecde7a4b1d1294f1d14d92132d157636862595cf6c4bf4c1ded6fc3d'
            '9ba052be04350ff7cd65f01491d5aba8df79edb7bcf53a9f2734133cee3d5386'
            '85abd3fb5c0351281a3e4a6001f138c251d791c92c0c45baf984fefa1bdb58c7')

package() {
  install -Dm755 "tippkraft-$pkgver" "$pkgdir/usr/bin/tippkraft"
  install -Dm644 60-tippkraft-uinput.rules "$pkgdir/usr/lib/udev/rules.d/60-tippkraft-uinput.rules"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
