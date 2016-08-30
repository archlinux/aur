# Maintainer: willemw <willemw12@gmail.com>

_pkgname=tv-overlord
pkgname=$_pkgname-git
pkgver=r335.d7b247f
pkgrel=1
pkgdesc="Download and manage tv shows"
url="https://github.com/8cylinder/tv-overlord"
license=('GPL')
arch=('any')
depends=('python-beautifulsoup4' 'python-click' 'python-colorama' 'python-dateutil'
         #'python-feedparser' 'python-tvdb_api' 'python-requests')
         'python-feedparser' 'python-tvdb_api-git' 'python-requests')
makedepends=('git' 'python-setuptools')
optdepends=('deluge: torrent client' 'transmission-cli: torrent client')
source=($_pkgname::git://github.com/8cylinder/tv-overlord.git)
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  python setup.py build
}

package() {
  cd $_pkgname
  python setup.py install --root="$pkgdir/" --optimize=1
}

