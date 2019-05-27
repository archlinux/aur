# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

_pkgbase='mcipc'
pkgname="${_pkgbase}-git"
pkgver=r193.5f04681
pkgrel=1
pkgdesc='Python 3 library and scripts for the RCON and Query protocol'
arch=('any')
url="https://github.com/coNQP/${_pkgbase}"
license=('GPLv3')
depends=('python' 'python-docopt')
makedepends=('git' 'python' 'python-setuptools' 'python-setuptools-git')
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')


pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
    cd "${srcdir}/${pkgname}"
    python setup.py install --root "${pkgdir}" --optimize=1
}
