# Maintainer: 9M2PJU <9m2pju@gmail.com>
# Contributor: Amir Shygun <a-shygun@users.noreply.github.com>
pkgname=terrascope-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Braille-rendered terminal world map with live weather and aircraft (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/a-shygun/terrascope"
license=('MIT')
depends=('glibc' 'zlib')
provides=('terrascope')
conflicts=('terrascope' 'terrascope-git')

source=(
  "LICENSE-$pkgver::https://raw.githubusercontent.com/a-shygun/Terrascope/v$pkgver/LICENSE"
  "terrascope-$pkgver.desktop::https://raw.githubusercontent.com/a-shygun/Terrascope/v$pkgver/packaging/linux/terrascope.desktop"
  "terrascope-$pkgver.png::https://raw.githubusercontent.com/a-shygun/Terrascope/v$pkgver/packaging/linux/terrascope.png"
  "terrascope-$pkgver.svg::https://raw.githubusercontent.com/a-shygun/Terrascope/v$pkgver/packaging/linux/terrascope.svg"
)
source_x86_64=(
  "$pkgname-$pkgver-x86_64.tar.gz::https://github.com/a-shygun/Terrascope/releases/download/v$pkgver/terrascope_${pkgver}_linux_x86_64.tar.gz"
)
source_aarch64=(
  "$pkgname-$pkgver-aarch64.tar.gz::https://github.com/a-shygun/Terrascope/releases/download/v$pkgver/terrascope_${pkgver}_linux_arm64.tar.gz"
)

sha256sums=('6fdf6c5182fffdc9935da92ba69d45886708a8fbf3422bd7e081874402c2010e'
            '8e0dffd902d0b3b56719a36bbabf99ca1f97395e9ea882fd2d810c22f665bd62'
            '592c27ab0549b709bbf39ad531c12ca960ace849ca6c78a8cdbe5e41d712e6c2'
            '3e1ad74852301e30890edf221bf5c76ed7fa5899f6da0f748f9adac4ae76be43')
sha256sums_x86_64=('83999c2db804015d2278ecc9aa1eba03a5fec4d63a9b225050287e6f86ed34ec')
sha256sums_aarch64=('ab5835b831c534b398fede6dbf52b0f8fae195eacaf1d904b7287596557c08a2')

package() {
  install -Dm755 "$srcdir/terrascope" "$pkgdir/usr/bin/terrascope"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/terrascope-$pkgver.desktop" "$pkgdir/usr/share/applications/terrascope.desktop"
  install -Dm644 "$srcdir/terrascope-$pkgver.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/terrascope.png"
  install -Dm644 "$srcdir/terrascope-$pkgver.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/terrascope.svg"
}
