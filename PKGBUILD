# Maintainer: wackbyte <wackbyte@protonmail.com>

_pkgname=hare-toml
pkgname=hare-toml-git
pkgver=0.1.2.r4.gef9afe0
pkgrel=1
pkgdesc='TOML implementation for Hare'
arch=('any')
url="https://codeberg.org/lunacb/${_pkgname}"
license=('MIT')
depends=('hare')
makedepends=('git')
provides=("hare-toml=${pkgver}")
conflicts=('hare-toml')
_commit='ef9afe03bb75da2861c3a8c48ec38fa4d84e2379'
source=("git+${url}#commit=${_commit}")
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
