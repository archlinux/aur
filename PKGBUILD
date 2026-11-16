# ByteWheel eReader — AUR package (prebuilt release binary)
# Built without MuPDF (MIT build). See packaging/aur/README.md for publishing.
pkgname=epub-byter-bin
pkgver=0.1.1
pkgrel=1
pkgdesc='Cross-platform eReader: multi-book EPUB library, terminal reader and SDL2 GUI (prebuilt)'
arch=('x86_64')
url='https://github.com/Bytewheel/epub-byter'
license=('MIT')
depends=(
  'glibc'
  'libxml2'
  'libsixel'
  'libzip'
  'sdl2'
  'sdl2_image'
  'sdl2_ttf'
  'zlib'
)
provides=('epub-byter')
conflicts=('epub-byter' 'epub-byter-git')
source=("https://github.com/Bytewheel/epub-byter/releases/download/v${pkgver}/epub-byter-${pkgver}-linux-x86_64.tar.gz")
# Filled in by packaging/aur/refresh-bin-checksums.sh after the release workflow runs
sha256sums=('c94adb670f75b7cc37dd356eb76462a07495e8ed9a7fc7f3be0ce8dcf2ad2baf')

package() {
  cp -a usr "$pkgdir"
  install -Dm644 "$pkgdir/usr/share/doc/epub-byter/LICENSE.md" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
