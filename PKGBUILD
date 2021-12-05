# Maintainer: Francesco Cherchi <francesco.cherchi@protonmail.com>
# Contributor: Francesco Cherchi <francesco.cherchi@protonmail.com>

pkgname=xdgmenumaker-git
pkgver=r204.7dd8a63
pkgrel=2
pkgdesc="A command line tool that generates XDG menus for several window managers"
url="https://github.com/gapan/${pkgname%-git}"
arch=('any')
license=('GPL3')
depends=('python-pyxdg' 'python-gobject' 'gtk3')
makedepends=('git')
optdepends=('txt2tags: for manpages' 'python-pillow: for restricting icon size')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir/" PREFIX="/usr" install
}

