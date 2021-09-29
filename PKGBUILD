# Maintainer: Jan0660 <jan0660@tutanota.com>

pkgname=comics-downloader-git
pkgdesc="Tool to download comics and manga in pdf/epub/cbr/cbz from a website."

pkgver() {
  cd "comics-downloader"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgver=r190.d166a3b
pkgrel=1
pkgbase=comics-downloader-git
replaces=()
arch=('x86_64')
url="https://github.com/Girbons/comics-downloader"
license=('MIT')
groups=()
makedepends=('git' 'go')
depends=()
source=('git+https://github.com/Girbons/comics-downloader.git')
sha256sums=('SKIP')

package() {
  cd "${srcdir}/comics-downloader/cmd/downloader"
  go build -o comics-downloader
  install -Dm 755 ./comics-downloader -t "${pkgdir}/usr/bin/"
}
