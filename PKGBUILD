# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=kde-svn2git
_name=${pkgname#kde-}
pkgver=1.0.18
pkgrel=1
pkgdesc="A fast-import based converter for an svn repo to git repos (aka svn-all-fast-export or KDE svn2git)"
arch=('any')
url="https://github.com/svn-all-fast-export/svn2git"
license=('GPL3')
depends=(apr git subversion)
makedepends=(qt5-base make)
source=("https://github.com/svn-all-fast-export/${_name}/archive/${pkgver}.tar.gz")
md5sums=('57eccceef1f775202e91df5107c5e15b')

build() {
  cd "$srcdir/${_name}-$pkgver"

  qmake
  make
}

package() {
  cd "$srcdir/${_name}-$pkgver"

  install -Dm755 svn-all-fast-export "$pkgdir/usr/bin/svn-all-fast-export"
}

# vim:set ts=2 sw=2 et:
