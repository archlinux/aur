pkgname=python3-asciitree-git
pkgver=r48.29712fb
pkgrel=1
pkgdesc="draws tree structures using characters."
arch=('any')
url="https://github.com/mbr/asciitree"
license=('MIT')
depends=('python3')
makedepends=('git')
source=("$pkgname"::'git+https://github.com/mbr/asciitree.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
}

package() {
   cd "$srcdir/$pkgname"
   python3 setup.py install --root="$pkgdir/"
}
