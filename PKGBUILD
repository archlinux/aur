# Maintainer: Ewen Le Bihan <hey@ewen.works>

pkgname=wikitrad-git
pkgver=r7.4f9c279
pkgrel=2
pkgdesc="A CLI to translate terms with wikipedia (bleeding edge)"
arch=('any')
url="https://github.com/ewen-lbh/wikitrad"
license=('GPL')
depends=('python')
makedepends=('git' "python-pip")
source=("git+https://github.com/ewen-lbh/wikitrad")
md5sums=('SKIP')

_gitname=wikitrad

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  pip install $_gitname --root="$pkgdir" --prefix=/usr
}

# vim:set ts=2 sw=2 et:

