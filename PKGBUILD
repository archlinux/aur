# Maintainer: willemw <willemw12@gmail.com>

_pkgname=podfox
pkgname=$_pkgname-git
pkgver=r57.68134b4
pkgrel=1
pkgdesc="Catch and manage podcasts from the terminal"
arch=('any')
url="https://github.com/brtmr/podfox"
license=('GPL3')
makedepends=('git')
depends=('python-colorama' 'python-docopt' 'python-feedparser' 'python-pycurl' 'python-requests')
provides=($_pkgname)
conflicts=($_pkgname)
source=($pkgname::git://github.com/brtmr/podfox.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $pkgname
  install -Dm755 podfox.py "$pkgdir/usr/bin/podfox"
}

