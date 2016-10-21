# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-usfm2osis-git
_pypiname=usfm2osis
pkgver=r94.c52fc37
pkgrel=1
_branch=master
pkgdesc="Tools for converting Bibles from USFM to OSIS XML"
arch=('any')
url="https://github.com/chrislit/usfm2osis"
license=('GPLv3')
makedepends=('git' 'python-setuptools')
depends=('python')
options=(!emptydirs)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git://github.com/chrislit/${_pypiname}.git#branch=${_branch}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pypiname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pypiname}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et: 
