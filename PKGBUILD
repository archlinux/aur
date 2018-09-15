# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

_pkgbase='httpam'
pkgname="python-${_pkgbase}-git"
pkgver=latest
pkgrel=2
pkgdesc='Python 3 library for web service authentication using PAM'
arch=('any')
url="https://github.com/conqp/${_pkgbase}"
license=('GPLv3')
depends=('python' 'python-pam')
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
