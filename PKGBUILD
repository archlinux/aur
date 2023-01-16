pkgname=ytui-music
pkgver=2.0.0b
_pkgver=2.0.0-beta
pkgrel=1
pkgdesc="Listen to music from youtube inside terminal with sleek tui"
arch=('x86_64')
url="https://github.com/sudipghimire533/ytui-music"
license=('GPL2')
provides=(${pkgname})
conflicts=(${pkgname}-bin)
depends=("mpv" "youtube-dl")
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sudipghimire533/$pkgname/archive/v$_pkgver.tar.gz")
sha256sums=('43deb6b3cb9eb836b7122ac2542106f46519f240f99a0af67eecdfa5b200cca7')

build() {
  cd "$pkgname-$_pkgver"

  cargo build --all --release
}


package() {
  cd "$pkgname-$_pkgver"

  install -Dm755 "target/release/ytui_music" "$pkgdir/usr/bin/ytui-music"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt"
}
