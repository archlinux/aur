# Maintainer: Philipp Joram <phijor AT t-online DOT de>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Mohammed Yaseen Mowzer <moyamodehacker@gmail.com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname='python-axolotl-git'
_pkgname='python-axolotl'
pkgver=r70.72f7c44
pkgrel=2
pkgdesc="The python-axolotl package, needed for Whatsapp Moxie support"
url="https://github.com/tgalal/python-axolotl"
arch=('any')
license=('GPL')
depends=('python' 'python-axolotl-curve25519-git' 'python-dateutil')
makedepends=('python-setuptools')
provides=('python-axolotl')
conflicts=('python-axolotl')
source=('git://github.com/tgalal/python-axolotl')
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/"
}
