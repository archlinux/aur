# Maintainer: Dario Giovannetti <dev at dariogiovannetti dot net>

_projname=gitcheck
_authname=badele
pkgname=${_projname}-git
pkgver=96.27697a0
pkgrel=1
pkgdesc='Check status of multiple git repositories in one pass'
arch=('any')
url="https://github.com/${_authname}/${_projname}"
license=('MIT')
depends=('python')
source=("git://github.com/${_authname}/${_projname}.git")
md5sums=('SKIP')

pkgver() {
  cd $_projname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    cd $_projname
    python setup.py install --root="$pkgdir" --optimize=1
}
