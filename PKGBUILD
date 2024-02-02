# Maintainer: Pierre Baconnier <orson.ouelles@outlook.com>
#https://wiki.archlinux.org/title/AUR_submission_guidelines

pkgname=fdispatcher-bin
arch=('x86_64')
pkgver=0.3.0
pkgrel=1
pkgdesc="An easy-to-use file dispatcher based on extension"
arch=('x86_64')
url="https://github.com/pbackz/fdispatcher"
license=('MIT')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
pkgbase=fdispatcher-bin

source=("https://github.com/pbackz/fdispatcher/releases/download/v${pkgver}/fd_x86_64")
sha256sums=("6d9e03e7167b15f8fb30e6f8a17ec9109324ab5700c1c5dffe7e1f066c7c073f")

prepare() {
  chmod +x fd_x86_64
  mv fd_x86_64 fd
}

package() {
  cd "${srcdir}"
  install -Dm755 "$srcdir/fd" "$pkgdir/usr/bin/fd"
}
