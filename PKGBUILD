# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=mon2cam-git
_pkgname=Mon2Cam
pkgver=r5.348413e
pkgrel=1
pkgdesc="Workaround for multi-monitor Discord screensharing"
arch=('any')
url="https://github.com/ShayBox/Mon2Cam"
license=('MIT')
depends=(
    'xorg-xrandr'
    'ffmpeg'
    'v4l2loopback-dkms'
)
source=(git+https://github.com/ShayBox/$_pkgname.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  
  install -Dm755 $_pkgname.sh "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
