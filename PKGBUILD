pkgname=ytui-music
pkgver=2.0.0rc1
_pkgver=2.0.0-rc1
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
sha256sums=('c41296d1dcb90e0bebf697c5077ee02f7b61cbb800198f468f0698285b9fd042')

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
