# Maintainer: Alberto Redondo <albertomost at gmail dot com>

_pkgname=bsptab
pkgname=$_pkgname-git
pkgver=0.1.r0.g37c3235
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

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd $_pkgname

  make DESTDIR="$pkgdir" install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
