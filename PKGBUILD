# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

_pkgbase='httpam'
pkgname="python-${_pkgbase}-git"
pkgver=r9.6c45106
pkgrel=1
pkgdesc='Python 3 library and scripts for the RCON and Query protocol'
arch=('any')
url="https://gitlab.com/coNQP/${_pkgbase}"
license=('GPLv3')
depends=('python' 'python-pam')
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
