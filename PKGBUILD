# Maintainer: John Jenkins <twodopeshaggy@gmail.com>


_pkgname=asciimatics
pkgname=asciimatics-git
pkgver=r261.4d9d846
pkgrel=1
pkgdesc="A cross platform package to do curses-like operations and create ASCII art animations"
arch=('any')
url="https://github.com/peterbrittain/asciimatics"
license=('APACHE2')
depends=('python' 'python-pyfiglet')
makedepends=('git')
source=('git://github.com/peterbrittain/asciimatics.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p $pkgdir/usr/share/licenses/$_pkgname/
  install -m 0644 LICENSE $pkgdir/usr/share/licenses/$_pkgname/
}
