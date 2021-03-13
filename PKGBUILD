# Maintainer: Jelle van der Waa <jelle@archlinux.org>

pkgname=pytest-pacman-git
pkgver=r11.552a376
pkgrel=1
pkgdesc="pacman db pytest fixture"
arch=('any')
license=('MIT')
url="https://gitlab.archlinux.org/jelle/pytest-pacman"
depends=(python python-pytest python-setuptools)
makedepends=(git)
source=(git+https://gitlab.archlinux.org/jelle/pytest-pacman.git)
sha512sums=('SKIP')

pkgver() {
  cd pytest-pacman
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd pytest-pacman
  python setup.py build
}

package() {
  cd pytest-pacman
  python setup.py install --root="${pkgdir}" -O1 --skip-build
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
