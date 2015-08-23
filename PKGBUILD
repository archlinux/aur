# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

_pkgname=define
pkgname=define-git
pkgver=r32.ee0ba49
pkgrel=1
pkgdesc="Terminal dictionary"
arch=('any')
url="https://github.com/SethDusek/define"
license=('BSD')
depends=('sox' 'python2' 'python2-wget' 'python2-wordnik' 'python2-requests')
makedepends=('git')
source=('git://github.com/shaggytwodope/define.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "$srcdir/$_pkgname"
  sed -i -e 's/python/python2/' define
}

package() {
  cd "$srcdir/$_pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
