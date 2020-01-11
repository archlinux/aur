# Maintainer: Mateusz Kaczanowski <kaczanowski.mateusz@gmail.com>
pkgname='parallella-examples'
provides=('parallella-examples')
pkgver=325.364595c
pkgrel=1
pkgdesc="Adapteva parallella board examples"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://https://github.com/parallella/parallella-examples"
license=('BSD' 'GPL')
depends=()
makedepends=()
optdepends=()
conflicts=()
backup=()
options=('!strip')
source=("git://github.com/parallella/parallella-examples.git")
md5sums=('SKIP')

pkgver() {
    cd "parallella-examples"
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "${srcdir}/parallella-examples"
  find . | grep "\.git/" | xargs rm -rf
}

package() {
  mkdir -p "${pkgdir}/opt/adapteva/examples"
  cp -r parallella-examples/* "${pkgdir}/opt/adapteva/examples/"
}
