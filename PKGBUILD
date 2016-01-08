# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
pkgname=orochi-git
pkgver=r186.6105257
pkgrel=1
pkgdesc="Orochi is a command line client for 8tracks.com."
arch=('any')
url="https://github.com/dbrgn/orochi"
license=('GPL')
groups=()
depends=('python')
makedepends=('git')
provides=('orochi')
conflicts=('orochi')
options=(!emptydirs)
source=('git+https://github.com/dbrgn/orochi')
md5sums=('SKIP')

_name=orochi

package() {
  cd "$srcdir/$_name"
  python setup.py install --root="$pkgdir/" --optimize=1
}

pkgver() {
  cd "$srcdir/$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
