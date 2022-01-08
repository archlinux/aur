# Maintainer: Nicolas Bizzozzéro <nicolas.bizzozzero@protonmail.com>
pkgname="python-cherche-git"
pkgver=0.0.1.r1.g12031b4
pkgrel=1
pkgdesc="Neural Search for middle sized corpus"
arch=("any")
url="https://raphaelsty.github.io/cherche/"
license=('MIT')
provides=("python-cherche-git")
conflicts=("python-cherche")
depends=("python" "python-elasticsearch" "python-numpy" "python-river" "python-tqdm")
makedepends=("git")
source=("git://github.com/raphaelsty/cherche.git")
sha512sums=("SKIP")

pkgver() {
  cd "${srcdir}/cherche"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/cherche"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

