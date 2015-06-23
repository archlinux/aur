# Maintainer: John Jenkins twodopeshaggy@gmail.com

pkgname=pyanisort-git
pkgver=r42.057e52b
pkgrel=1
pkgdesc="Automatically sorts anime using information from anidb.net"
arch=('any')
url="https://github.com/jotaro0010/pyanisort"
license=('MIT')
makedepends=('git')
depends=('python' 'python-setuptools')
source=('git+https://github.com/jotaro0010/pyanisort.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/pyanisort"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
   cd "$srcdir/pyanisort"
   python setup.py install --root="$pkgdir/" --optimize=1
   mkdir -p $pkgdir/usr/share/licenses/$pkgname
   install -m 0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
