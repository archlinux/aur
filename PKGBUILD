# Maintainer: Jonathan Sanfilippo <jonalinux dot uk at gmail dot com>

pkgname=clean-git
pkgver=2.0.r1.gca10c20
pkgrel=1
pkgdesc="$ clean - easy command for arch linux, orphans, cache"
arch=('any')
url="https://github.com/architalia/clean"
license=('GPL3')
depends=('bash' 'bc')
makedepends=(git)
provides=(clean)
conflicts=(clean)
source=("git+https://github.com/architalia/clean.git")
sha256sums=('SKIP')

pkgver() {
  cd clean
  # git with tags, cut 'v' prefix
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd clean/src
  install -Dm755 -t "$pkgdir/usr/bin/" clean
}
