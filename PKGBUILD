# Maintainer: Austin Haedicke <austin.haedicke@gamil.com>

pkgname=dnd-tools
pkgver=r36.baefb9e
pkgrel=1
pkgdesc='Interactive CLI tools for Dungeons and Dragons 5e'
depends=('python')
makedepends=('git' 'python')
arch=('i686' 'x86_64')
url='https://gitlab.com/savagezen/dnd-tools'
license=('AGPLv3')
conflicts=('dnd-tools')
provides=('dnd-tools')
source=(git://github.com/savagezen/dnd-tools.git)
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${srcdir}/${pkgname} 
  python setup.py install --root="$pkgdir"
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
