# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

_pkgname=define
pkgname=define-git
pkgver=r211.1629b86
pkgrel=1
pkgdesc="Terminal dictionary"
arch=('any')
url="https://github.com/SethDusek/define"
license=('BSD')
depends=('gstreamer' 'python' 'python-requests')
optdepends=('hunspell' 'dictd')
makedepends=('python-setuptools' 'git')
conflicts=('define')
source=('git://github.com/SethDusek/define.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}
