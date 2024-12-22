# Maintainer: GaryOderNichts <garyodernichts at gmail dot com>
pkgname=docker-explorer-git
gitname=docker-explorer
pkgver=20241004.r1.g9b2af4c
pkgrel=1
pkgdesc="A tool to help forensicate offline docker acquisitions"
arch=('any')
url="https://github.com/google/${gitname}"
license=('Apache')
depends=('python')
makedepends=('python' 'python-setuptools' 'git')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${gitname}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${gitname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${gitname}"
  python setup.py install --root="${pkgdir}"
}
