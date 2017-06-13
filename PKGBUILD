# Maintainer: Austin Haedicke
# austin.haedicke@gamil.com

pkgname=dnd-tools
pkgver=ec678ea
pkgrel=1
pkgdesc='Interactive CLI tools for Dungeons and Dragons 5e'
depends=('python>=3.6')
makedepends=('git' 'python')
arch=('i686' 'x86_64')
url='https://github.com/gtbjj/dnd-tools'
license=('AGPLv3')
conflicts=('')
provides=('dnd-tools')
source=(git://github.com/gtbjj/dnd-tools.git)
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git rev-parse --short HEAD
}

package() {
  cd ${srcdir}/${pkgname} 
  python setup.py install --root="$pkgdir"
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
