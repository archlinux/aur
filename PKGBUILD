# Maintainer: johncena141 <johncena141@protonmail.com>
pkgname="chad_launcher-git"
pkgver='r68.03ef7b8'
pkgrel=1
pkgdesc="GNU/LINUX GAMING UNLEASHED!"
arch=('x86_64')
url="https://gitlab.com/Gnurur/chad_launcher"
license=('custom')
depends=(python python-gobject gtk3)
makedepends=(pkgconf git)
source=('git+https://gitlab.com/Gnurur/chad_launcher.git')
md5sums=('SKIP')


pkgver() {
  cd "chad_launcher"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "chad_launcher"
    python setup.py build

}

package() {
    cd "$srcdir/chad_launcher"
    python "setup.py" install --root="$pkgdir" --optimize=1 --skip-build
}
