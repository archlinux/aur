# Maintainer: Alberto Redondo <albertomost at gmail dot com>

_pkgname=bsptab
pkgname=$_pkgname-git
pkgver=r10.ae0bf1b
pkgrel=1
pkgdesc='Suckless'"'"' tabbed integration into bspwm'
arch=('any')
url='https://github.com/albertored11/bsptab'
license=('MIT')
depends=('bspwm' 'tabbed' 'bash' 'awk' 'xorg-xwininfo' 'xorg-xprop' 'xorg-xwininfo' 'xdotool')
makedepends=('git')
provides=('bsptab')
conflicts=('bsptab')
source=("$_pkgname::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $_pkgname

  make DESTDIR="$pkgdir" install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
