pkgname=lala-git
pkgver=0.2_129_g891b782
pkgrel=1
pkgdesc="irc bot"
arch=("any")
url="https://github.com/mineo/lala"
license=('MIT')
groups=()
depends=('python2' 'twisted')
makedepends=('git')
source=('git+https://github.com/mineo/lala.git')
md5sums=('SKIP')

pkgver(){
  cd "$srcdir/lala"
  echo "$(git describe --tags --always | sed 's/-/_/g')"
}

package() {
  cd "$srcdir/lala"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
