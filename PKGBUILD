# Maintainer: robertfoster
pkgname=flict-git
pkgver=v0.1.1.r110.g1644b92
pkgrel=1
pkgdesc="Open source software license compatibility tool"
arch=('any')
depends=('python' 'python-license-expression' 'python-osadl-matrix')
makedepends=('python-setuptools')
url="https://github.com/vinland-technology/flict"
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
license=('GPL3')
source=("${pkgname%%-git}::git+${url}")

pkgver() {
  cd "${pkgname%%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${pkgname%%-git}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

sha256sums=('SKIP')
