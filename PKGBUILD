pkgname=ani-cli-mx
pkgver=1.0.0
pkgrel=1
_tag="v$pkgver"
pkgdesc='Spanish-first anime CLI'
arch=('any')
url='https://github.com/Gildedboy/ani-cli-mx'
license=('GPL3')
depends=('curl' 'sed' 'grep' 'fzf' 'openssl' 'mpv')
optdepends=(
  'vlc: alternative player backend'
  'aria2: direct-file downloads'
  'yt-dlp: extra extractor coverage and download handling'
  'ffmpeg: HLS/m3u8 download fallback'
  'patch: self-update support with -U'
  'ani-skip: intro skipping with mpv'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_tag.tar.gz")
sha256sums=('83e102b8cd0b79fef6c1b87e86ac368c2c4b153a3b30687a6ba5f8d77b802663')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 ani-cli-mx-core "$pkgdir/usr/libexec/ani-cli-mx"
  install -Dm755 ani-cli-mx "$pkgdir/usr/bin/ani-cli-mx"
  install -Dm644 ani-cli-mx.1 "$pkgdir/usr/share/man/man1/ani-cli-mx.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
