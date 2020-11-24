# Maintainer: Akatsuki Rui <akiirui@outlook.com>

pkgname="mpv-handler-git"
_pkgname=${pkgname%-git}
pkgver=2020.11.19.r3.gac2a68d
pkgrel=1
pkgdesc="Play website videos and songs with mpv & youtube-dl."
arch=("any")
depends=("mpv" "youtube-dl")
makedepends=("git")
url="https://github.com/akiirui/mpv-handler/"
license=("MIT")
source=("git+https://github.com/akiirui/mpv-handler.git")
b2sums=("SKIP")

pkgver() {
  cd "${srcdir}/$_pkgname"
  git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -D -m 755 linux/mpv-handler "${pkgdir}/usr/bin/mpv-handler"
  install -D -m 644 linux/mpv-handler.desktop "${pkgdir}/usr/share/applications/mpv-handler.desktop"

  install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
