# Maintainer: meister1593 <leruop@gmail.com>

pkgname=mon2cam-bash-git
_pkgname=mon2cam
pkgver=r31.07e4838
pkgrel=1
pkgdesc="Workaround for multi-monitor Discord screensharing"
arch=('any')
url="https://github.com/Meister1593/Mon2Cam"
license=('MIT')
depends=(
    'xorg-xrandr'
    'ffmpeg'
    'v4l2loopback-dkms'
)
makedepends=('git')
provides=('mon2cam')
conflicts=('mon2cam')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  
  install -Dm755 $_pkgname.sh "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
