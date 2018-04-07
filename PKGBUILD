# Maintainer: Victor Roest <victor@xirion.net>
pkgname=dice-roller-git
pkgver=ced0687
pkgrel=1
pkgdesc="A python dice rolling application using the standard dice notation"
url="https://git.xirion.net/victor/dice-roller"
license=('GPL3')
depends=('python')
makedepends=('git' 'python')
arch=('i686' 'x86_64')
provides=('dice-roller')
source=(git+https://git.xirion.net/vroest/dice-roller.git)
sha256sums=('SKIP')

pkgver() {
    cd dice-roller
    git rev-parse --short HEAD
}

package() {
    cd "$srcdir/dice-roller"
    python setup.py install --root="$pkgdir" --optimize=1
}
