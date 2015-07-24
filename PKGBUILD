# Maintainer: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>

pkgname=dmenu-extended
pkgver=r191.f7b776b
pkgrel=1

pkgdesc='An extension to dmenu for quickly opening files and folders.'
url='https://github.com/markjones112358/dmenu-extended'
license=('MIT')
arch=('any')

depends=('dmenu' 'python')
makedepends=('python')
source=("git+https://github.com/markjones112358/dmenu-extended.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/-/./g'
}

package() {
  cd "$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
