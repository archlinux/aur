# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

_pkgbase='mcipc'
pkgname="python-${_pkgbase}-git"
pkgver=r142.30b3b0b
pkgrel=1
pkgdesc='Python 3 library and scripts for the RCON and Query protocol'
arch=('any')
url="https://gitlab.com/coNQP/${_pkgbase}"
license=('GPLv3')
depends=('python' 'python-docopt' 'python-pyzmq')
makedepends=('git' 'python')
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
