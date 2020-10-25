# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=gif-for-cli-git
pkgver=r25.31f8aa2
pkgrel=1
pkgdesc="Render an animated GIF to your command line terminal."
arch=('any')
url="https://github.com/google/gif-for-cli"
license=('Apache')
depends=('python' 'python-pillow' 'python-requests' 'python-x256-git' 'ffmpeg')
makedepends=('git' 'python-setuptools')
source=("$pkgname::git+https://github.com/google/gif-for-cli")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  python setup.py build
}

package() {
  cd "$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
