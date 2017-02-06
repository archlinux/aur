# Maintainer: archlinux.info:tdy

pkgbase=python-mpv-git
pkgname=(python-mpv-git)
pkgver=r55.8b9411e
pkgrel=1
pkgdesc="A ctypes-based Python interface to the mpv media player"
arch=(any)
url=https://github.com/jaseg/${pkgname%-git}
license=(AGPL3)
depends=(python mpv)
makedepends=(git python-setuptools)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=($pkgname::git+https://github.com/jaseg/${pkgname%-git}.git)
sha256sums=(SKIP)

pkgver() {
  cd $pkgname
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd $pkgname
  python setup.py build
}

package_python-mpv-git() {
  cd $pkgname
  python setup.py install --root="$pkgdir" --optimize=1
}
