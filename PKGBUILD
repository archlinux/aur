# Maintainer: Jaiden Brooke <jaiden.lily.brooke@gmail.com>
pkgname=language-toolkit
pkgver=0.1.0
pkgrel=3
pkgdesc="A simple tool to document and create languages"
url=https://git.gay/ika4422/language-toolkit
arch=('x86_64' 'aarch64')
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'hicolor-icon-theme')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://git.gay/ika4422/language-toolkit/archive/v$pkgver.tar.gz")
sha256sums=('3834f1d8f54d41faed41603a747a29fa28f76dd6a3ba96b2754d8aea7891e429')

build() {
  cd "$srcdir/../.."
  cargo build --release
}

package() {
  cd "$srcdir/../.."

  install -Dm755 "target/release/language-toolkit" "$pkgdir/usr/bin/language-toolkit"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "pkg/language-toolkit.desktop" "$pkgdir/usr/share/applications/language-toolkit.desktop"

  install -Dm644 "assets/icons/icon_512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/language-toolkit.png"
  install -Dm644 "assets/icons/icon_256x256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/language-toolkit.png"
  install -Dm644 "assets/icons/icon_128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/language-toolkit.png"
  install -Dm644 "assets/icons/icon_48x48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/language-toolkit.png"
}
