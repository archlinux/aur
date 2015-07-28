# Maintainer: Kai Yuan <kent.yuan@gmail.com>
pkgname=passwdmanager-git
pkgver=r64.6064018
pkgrel=1
pkgdesc="Password management tool"
arch=('any')
url="https://github.com/sk1418/passwdmanager"
license=('GPL3')
makedepends=('git')
depends=('wxpython' 'python2-crypto' 'python2-setuptools')
sha256sums=('SKIP')
sha512sums=('SKIP')
source="$pkgname::git+http://github.com/sk1418/${pkgname%-*}.git"

pkgver(){
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname}"
  find . -name "*.py" |xargs sed -i "s|/usr/bin/python|&2|" 
  python2 setup.py install --root="$pkgdir" --prefix="/usr"
}

# vim:set ts=2 sw=2 et:
