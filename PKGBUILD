# Maintainer: wackbyte <im@purring.fyi>

_pkgname=hare-toml
pkgname=hare-toml-git
pkgver=0.2.0.r1.gad5daee
pkgrel=1
pkgdesc='TOML implementation for Hare'
arch=('any')
url="https://codeberg.org/lunacb/${_pkgname}"
license=('MIT')
depends=('hare')
makedepends=('git')
provides=("hare-toml=${pkgver}")
conflicts=('hare-toml')
source=("git+${url}")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd $_pkgname

  make check
}

package() {
  cd $_pkgname

  make DESTDIR="${pkgdir}" PREFIX=/usr install
}
