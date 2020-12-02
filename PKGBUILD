# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

_pkgbase='functoolsplus'
pkgname="python-${_pkgbase}-git"
pkgver=r28.36621d5
pkgrel=1
pkgdesc='Even higher-order functions and operations on callable objects'
arch=('any')
url="https://gitlab.com/HOMEINFO/${_pkgbase}"
license=('GPLv3')
depends=('python')
makedepends=('git' 'python')
provides=("python-${_pkgbase}")
conflicts=("python-${_pkgbase}")
source=("${_pkgbase}::git+${url}.git")
md5sums=('SKIP')
pkgdir='pkg'
srcdir='src'


pkgver() {
  cd "${_pkgbase}" || exit 1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
    cd "${srcdir}/${_pkgbase}"
    python setup.py install --root "${pkgdir}" --optimize=1
}
