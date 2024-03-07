# Maintainer: Gesh <gesh@gesh.uni.cx>

pkgname=python-papis-scihub-git
_plugname="${pkgname%-git}"
_plugname="${_plugname#python-}"
pkgver=1.4.0
pkgrel=1
pkgdesc='Papis plugin to import from Sci-Hub (incorporates upstream PR #62)'
arch=('any')
url='https://github.com/papis/scripts/tree/master/papis-scihub'
license=('GPL3')
depends=('python')
makedepends=('python-build' 'python-installer')
#source=("$pkgname::git+${url%/$_plugname}.git")
source=("$pkgname::git+https://github.com/hseg/scripts.git#branch=local") # PR62
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}/${_plugname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}/${_plugname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
