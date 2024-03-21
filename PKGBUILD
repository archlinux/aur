# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=battop-bin
pkgver=0.2.4
pkgrel=1
pkgdesc="Interactive batteries viewer (binary release)"
url="https://github.com/svartalf/rust-battop"
license=('Apache-2.0' 'MIT')
arch=('x86_64')
provides=("battop")
conflicts=("battop")
source=("battop-$pkgver::$url/releases/download/v$pkgver/battop-v$pkgver-x86_64-unknown-linux-gnu"
        "$url/raw/v$pkgver/assets/screenshot.png"
        "CHANGELOG.md::$url/raw/v$pkgver/CHANGELOG.md"
        "README.md::$url/raw/v$pkgver/README.md"
        "LICENSE-APACHE::$url/raw/v$pkgver/LICENSE-APACHE"
        "LICENSE-MIT::$url/raw/v$pkgver/LICENSE-MIT")
sha256sums=('8b601903d550a2efe3825c57720cff17a89783828885d99d3b9519895cd10de5'
            'bfde06b77c9024194725011fe98fe00ae364a5d48689a0366fda45b0dbcfbd23'
            'c7637817ad4e4cdf838b4f3a2b9683d85b8eac744cfd114e702fa7aa7ed4b8fb'
            'a16b66b38e9a5e668648b0951aeda3863285d3844741ef8bc054753a636bd0d6'
            '53297eaaac87f6c139b2a6b8e94be8bcb594b7debcb13d12a22c2d1ad79718a5'
            '2f95702fc749faea961cd826fec7a6611319bc7fc860db0c1011b706fe81f934')

prepare() {
# Shortcut
  echo -e "[Desktop Entry]
Name=battop
Exec=battop
Icon=battop
Terminal=true
Type=Application
Comment=Interactive batteries viewer" > battop.desktop
}

package() {
  install -Dm644 battop.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 screenshot.png "$pkgdir/usr/share/pixmaps/battop.png"
  install -Dm644 CHANGELOG.md README.md -t "$pkgdir/usr/share/doc/battop"
  install -Dm644 LICENSE-APACHE LICENSE-MIT -t "$pkgdir/usr/share/licenses/battop"
  install -Dm755 battop-$pkgver "$pkgdir/usr/bin/battop"
}
