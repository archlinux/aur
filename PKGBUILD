# Maintainer: Pierre Baconnier <orson.ouelles@outlook.com>
#https://wiki.archlinux.org/title/AUR_submission_guidelines

pkgname=fdispatcher-bin
arch=('x86_64')
pkgver=0.3.0
pkgrel=2
pkgdesc="An easy-to-use file dispatcher based on extension"
arch=('x86_64')
url="https://github.com/pbackz/fdispatcher"
license=('MIT')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
pkgbase=fdispatcher-bin

source=("https://github.com/pbackz/fdispatcher/releases/download/v${pkgver}/fd_x86_64")
sha256sums=("f50e8f182b621eb0a982f2477dd0813d9f72f37c9c03fa6a48ed9c4de9c5ae63")

prepare() {
  chmod +x fd_x86_64
  mv fd_x86_64 fd
}

package() {
  cd "${srcdir}"
  install -Dm755 "$srcdir/fd" "$pkgdir/usr/bin/fd"
}
