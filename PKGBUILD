# Maintainer: John Jenkins twodopeshaggy@gmail.com

pkgname=rtv-git
pkgver=r345.2a93592
pkgrel=1
pkgdesc="Browse Reddit from your terminal"
arch=('any')
url="https://github.com/michael-lazar/rtv"
license=('MIT')
conflicts=('rtv')
makedepends=('git')
depends=('python3-kitchen' 'ncurses' 'python' 'python-six' 'python-requests' 'python-praw-git' 'python-setuptools')
source=('git+https://github.com/michael-lazar/rtv.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/rtv"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
   cd "$srcdir/rtv"
   python setup.py install --root="$pkgdir/" --optimize=1
   mkdir -p $pkgdir/usr/share/licenses/$pkgname
   install -m 0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
