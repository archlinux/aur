# Maintainer: John Jenkins twodopeshaggy@gmail.com

pkgname=kiara-git
pkgver=r50.d9ea66e
pkgrel=1
pkgdesc="Automatically sorts anime using information from anidb.net"
arch=('any')
url="https://github.com/hartfelt/kiara"
license=('MIT')
install=$pkgname.install
makedepends=('git')
depends=('python' 'python-colorama' 'python-setuptools')
source=('git+https://github.com/hartfelt/kiara.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/kiara"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
   cd "$srcdir/kiara"
   python setup.py install --root="$pkgdir/" --optimize=1
   mkdir -p $pkgdir/usr/share/licenses/$pkgname
   install -m 0644 kiararc $pkgdir/etc/
}
