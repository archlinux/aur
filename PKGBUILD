# Maintainer: Scott Hansen (firecat53) firecat4153 at gmail
pkgname=urlscan-git
_gitname=urlscan
pkgver=r49.f0ae093
pkgrel=1
pkgdesc="Replacement for urlview with html context and other improvements."
arch=('any')
url="https://github.com/firecat53/urlscan"
license=('GPL')
conflicts=('urlscan')
provides=('urlscan')
depends=('python' 'python-urwid')
makedepends=('git' 'python-setuptools')
source=('git://github.com/firecat53/urlscan.git')
md5sums=('SKIP')
install=urlscan.install

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_gitname"
  ./setup.py install --root=${pkgdir} --optimize=1 || return 1
}

