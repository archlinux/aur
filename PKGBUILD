# Maintainer: Syaoran Code <syaorancode@gmail.com>

pkgname=scrcast-git
_dir=scrcast
pkgver=1.0.r2.ee88c51
pkgrel=1
pkgdesc="A simple screen recorder using ffmpeg."
arch=(x86_64 i686)
url="https://github.com/justanoobcoder/scrcast.git"
license=('MIT')
depends=(bash ffmpeg)
makedepends=(make)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd "${_dir}"
    printf "%s.r%s.%s" "$(awk '/VERSION/ {print $2}' scrcast)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_dir}"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
