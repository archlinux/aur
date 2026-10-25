# Maintainer: Gabriel <horizzon3507>
pkgname=stillmusic-bin
pkgver=0.3.0beta1
_tag=0.3.0-beta.1
pkgrel=1
pkgdesc='Minimal black and white CLI music player powered by MPV (prebuilt binary)'
arch=('x86_64')
url='https://github.com/fireflylabss/optionMusic'
license=('Apache-2.0')
depends=('mpv' 'libgcc' 'glibc' 'sqlite')
optdepends=('cava: spectrum bars'
            'yt-dlp: download music and videos'
            'ffmpeg: extract and convert downloaded audio'
            'tar: export and import backups')
provides=("stillmusic=$pkgver")
conflicts=('stillmusic' 'optionmusic' 'optmusic')
options=('!strip' '!lto')
source=("$url/releases/download/v$_tag/stillmusic-v$_tag-$CARCH-unknown-linux-gnu.tar.gz")
sha256sums=('ffadb3b0b0dd99aedeac613d97295044b8d41aff284ba12f9dc121db28485840')

package() {
  install -Dm755 still "$pkgdir/usr/bin/still"
  install -Dm755 msc "$pkgdir/usr/bin/msc"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
