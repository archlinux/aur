# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

_pkgbase='timelib'
pkgname="python-${_pkgbase}-git"
pkgver=r29.0c6da92
pkgrel=2
pkgdesc='A library for handling time data'
arch=('any')
url="https://gitlab.com/HOMEINFO/${_pkgbase}"
license=('GPLv3')
depends=('python')
conflicts=('python-timelib')
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
