# Maintainer: Morten Linderud <morten@linderud.pw>
# Contributor: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>

pkgname=dmenu-extended
pkgver=r280.4f0395f
pkgrel=1
pkgdesc='An extension to dmenu for quickly opening files and folders.'
url='https://github.com/markjones112358/dmenu-extended'
license=('MIT')
arch=('any')
depends=('dmenu' 'python')
makedepends=('python' 'git')
source=("git+https://github.com/markjones112358/dmenu-extended.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
