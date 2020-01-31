# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

_pkgbase='peeweeplus'
pkgname="python-${_pkgbase}-git"
pkgver=r425.3133374
pkgrel=1
pkgdesc='Practical extension of a small, expressive ORM'
arch=('any')
url="https://gitlab.com/HOMEINFO/${_pkgbase}"
license=('GPLv3')
depends=('python' 'python-peewee' 'python-timelib' 'python-strflib')
optdepends=('python-argon2_cffi: for Argon2Field' 'python-authlib: for authlib integration')
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
