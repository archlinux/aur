# Maintainer: John Jenkins twodopeshaggy@gmail.com

pkgname=mangaget2-git
pkgver=r24.1ba0676
pkgrel=1
pkgdesc="A terminal based manga ripper."
arch=('any')
url="https://github.com/darkdragn/mangaGet2"
license=('')
makedepends=('git')
depends=('ncurses' 'python2' 'python2-six' 'python2-requests' 'python2-praw' 'python2-beautifulsoup4' 'python2-setuptools')
source=('git+https://github.com/darkdragn/mangaGet2.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/mangaGet2"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
   cd "$srcdir/mangaGet2"
   python2 setup.py install --root="$pkgdir/" --optimize=1
}
