# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
_pkgname="youtube-tui"
pkgname="$_pkgname-nodefaults-bin"
pkgver=0.8.1
pkgrel=1
pkgdesc="An aesthetically pleasing TUI frontend to browsing YouTube written in Rust. (Binary)"
arch=('x86_64')
url="https://github.com/Siriusmart/$_pkgname"
_url_raw="https://raw.githubusercontent.com/$(echo "$url" | awk -F'/' '{print $4 "/" $5}')"
license=('GPL-3.0')
depends=('libxcb')
optdepends=(
  'mpv: default video player'
  'konsole: default terminal emulator'
  'yt-dlp: default youtube downloader'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname-nodefaults_arch-$CARCH.youtube-tui-nodefaults_arch-$CARCH"
    "LICENSE-$pkgver::$_url_raw/refs/tags/v$pkgver/LICENSE"
    "README-$pkgver.md::$_url_raw/refs/tags/v$pkgver/README.md")
sha256sums=('6829d9d672455a1d531093e139ad23aa6d0b7b1814775bf2752e4278dc62654a' 'SKIP' 'SKIP')

package() {
    cd "$srcdir"
    install -Dm0755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
