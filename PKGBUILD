# Maintainer: Dario Giovannetti <dev at dariogiovannetti dot net>

_projname=repocheck
_authname=kynikos
pkgname=${_projname}-git
pkgver=5.5113fef
pkgrel=1
pkgdesc='Check the status of code repositories under a root directory'
arch=('any')
url="https://github.com/${_authname}/${_projname}"
license=('GPL3')
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
