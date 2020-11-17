# Maintainer: Akatsuki Rui <akiirui@outlook.com>

pkgname="mpv-handler-git"
_pkgname="play-with-mpv-handler"
pkgver=2020.11.17.1.r0.gf62b272
pkgrel=1
pkgdesc="Play website videos and songs with mpv & youtube-dl."
arch=('any')
depends=('mpv' 'youtube-dl')
url="https://github.com/akiirui/play-with-mpv-handler/"
license=('MIT')
source=("git+https://github.com/akiirui/play-with-mpv-handler.git")
b2sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_pkgname}/linux/"
  install -D -m 755 mpv-handler ${pkgdir}/usr/bin/mpv-handler
  install -D -m 644 mpv-handler.desktop ${pkgdir}/usr/share/applications/mpv-handler.desktop
}
