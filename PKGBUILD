# Maintainer: John Jenkins twodopeshaggy@gmail.com

pkgname=mangaget2-git
pkgver=r293.9153fdd
pkgrel=1
pkgdesc="A terminal based manga ripper."
arch=('any')
url="https://github.com/darkdragn/mangaGet2"
license=('')
makedepends=('git')
depends=('ncurses' 'python' 'python-six' 'python-requests' 'python-praw' 'python-setuptools')
source=('git+https://github.com/darkdragn/mangaGet2.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/manageGet2"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
   cd "$srcdir/mangaGet2"
   python2 setup.py install --root="$pkgdir/" --optimize=1
}
