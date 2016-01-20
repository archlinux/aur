# Maintainer: Leif Warner <abimelech@gmail.com>
pkgname=pymodoro-git
_gitname=pymodoro
pkgver=r101.0136d4c
pkgrel=1
pkgdesc="Pomodoro for Xmobar or Dzen"
arch=(any)
url=https://github.com/dattanchu/pymodoro
depends=(python)
makedepends=(git python-setuptools)
provides=(pymodoro)
conflicts=(pymodoro)
source=(git+https://github.com/dattanchu/pymodoro.git)
md5sums=(SKIP)

pkgver() {
    cd "$_gitname"
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_gitname"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -D README.md "$pkgdir"/usr/share/doc/pymodoro/README.md
}
