# Maintainer: Lex Black <autumn-wind at web dot de>

_pkgname=ytfs
pkgname=${_pkgname}-git
pkgver=r86.d689c7f
pkgrel=1
pkgdesc="FUSE based filesystem for YouTube (git version)"
arch=('any')
url="https://github.com/rasguanabana/ytfs"
license=('MIT')
depends=('python-requests' 'python-fusepy' 'youtube-dl')
makedepends=('git')
source=("git://github.com/rasguanabana/${_pkgname}.git")
md5sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  cd ${_pkgname}
  python setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}
