# Maintainer: Andrew Shark <ashark@at linuxcomp@ru>

pkgname=jb-url-handler-git
_pkgname=${pkgname%-git}
pkgver=r1.7b11d87
pkgrel=1
pkgdesc="Handler for unofficial jb:// scheme for JetBrains IDEs"
url="https://github.com/Ashark/jb-url-handler"
arch=('any')
depends=('desktop-file-utils')
source=("git+$url")
sha256sums=("SKIP")

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  install -Dm644 "$_pkgname/$_pkgname.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "$_pkgname/jb_beam.svg" -t "$pkgdir/usr/share/pixmaps"
  install -Dm755 "$_pkgname/$_pkgname" -t "$pkgdir/usr/bin/"
}
