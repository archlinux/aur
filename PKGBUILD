# Maintainer: Michał Sidor (Michcioperz) <packages at meekchopp dot es>
_pkgbase=believer
pkgname=$_pkgbase-git
pkgver=v0.1.0.r0.g323c571
pkgrel=1
pkgdesc="xrandr wrapper for quick and carefree setup of multiple screens"
arch=("x86_64" "i686")
url="https://github.com/michcioperz/believer"
license=('GPL3')
depends=('xorg-xrandr')
makedepends=('go' 'git')
source=('git+https://github.com/michcioperz/believer')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgbase"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgbase"
  go build believer.go
}

package() {
  cd "$_pkgbase"
  install -Dm755 believer "$pkgdir"/usr/bin/believer
}
