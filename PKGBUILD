# Maintainer: Bernhard Landauer <oberon@manjaro.org>

pkgname=alternating-layouts-git
pkgver=r24.da6584a
pkgrel=1
pkgdesc="Alternating split directions for the i3-wm"
_repo=i3-alternating-layout
url="github.com/olemartinorg/$_repo"
arch=('any')
license=('MIT')
depends=('i3-wm'
	'python-i3-git'
	'xorg-utils')
conflicts=('alternating-layouts')
makedepends=('git')
install=alternating-layouts.install
source=("git://$url")
md5sums=('SKIP')

pkgver() {
  cd $_repo
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $_repo
  install -Dm 755 alternating_layouts.py $pkgdir/usr/bin/alternating_layouts.py
}
