# Maintainer: antlis <antlis@protonmail.com>
# Installs the prebuilt Linux binary from the GitHub release (no compiling).
pkgname=unbloated-youtube-bin
_name=unbloated-youtube
pkgver=0.24.0
pkgrel=1
pkgdesc='Lightweight, configurable YouTube desktop client: GPUI, embedded mpv, yt-dlp (prebuilt binary)'
arch=('x86_64')
url='https://github.com/antlis/unbloated-youtube'
license=('AGPL-3.0-only')
depends=('gcc-libs' 'glibc' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'wayland'
         'vulkan-icd-loader' 'vulkan-driver' 'mpv' 'yt-dlp' 'deno')
provides=("$_name")
conflicts=("$_name")
options=('!strip')
source=("$url/releases/download/v$pkgver/$_name-$pkgver-x86_64-linux.tar.gz")
sha256sums=('a95aedb75ee6a0e31e74124ad87a781b56e07cae21fbe2cb84345a5a840ced0e')

package() {
  cd "$_name-$pkgver-x86_64-linux"
  install -Dm755 "$_name" "$pkgdir/usr/bin/$_name"
  install -Dm644 "$_name.desktop" "$pkgdir/usr/share/applications/$_name.desktop"
  install -Dm644 "$_name.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_name.svg"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
