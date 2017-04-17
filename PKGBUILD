
# Maintainer: Juan Toca <elan17.programacion@gmail.com>
pkgname=snakes-git
pkgver=r52.c9182bf
pkgrel=1
pkgdesc="Snake-based ZPG game"
arch=('any')
url="https://github.com/elan17/snakes-terminalsaver"
license=('GPL3')
groups=()
depends=()
makedepends=('git' 'python') 
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
replaces=()
backup=()
options=(!emptydirs)
install=
source=('snakes-git::git+https://github.com/elan17/snakes-terminalsaver#branch=master')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$pkgname"
  	install -Dm 755 snakes.py "${pkgdir}/usr/bin/snakes"
  	install -Dm 644 LICENSE "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}

