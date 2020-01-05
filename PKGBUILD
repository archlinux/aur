#Maintainer: jnanar <info@agayon.be>

pkgname=python-kivy-garden-modernmenu
pkgver=681c3bf
pkgrel=1
pkgdesc="A context menu for Kivy with modern look and feel."
arch=(any)
url=""
license=('MIT')
depends=('python')
options=(!emptydirs)
#optdepends=('')
provides=('python-kivy-garden-modernmenu')

source=('git+https://github.com/kivy-garden/modernmenu.git')
_gitname="modernmenu"
sha512sums=('SKIP')

pkgver() {
  cd $_gitname
  git rev-parse --short HEAD  | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


package() {
  cd "$srcdir/$_gitname"
  python setup.py install --root="$pkgdir/" --optimize=1
}
