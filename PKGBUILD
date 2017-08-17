# Maintainer: Icaro Perseo <icaroperseo[at]protonmail[dot]com>

_pkgname=instant-rst
pkgname="vim-${_pkgname}"
_commit=2d32636 # 7 digits
pkgver=20170628
pkgrel=1
pkgdesc="A local server for preview rst document instantly"
arch=('any')
url="https://github.com/Rykka/instant-rst.py"
license=('CPL')
depends=('python2-flask' 'python2-docutils' 'python2-pygments' 'python2-flask-socketio' 'python2-socketio')
makedepends=('python2-setuptools')
optdepends=('vim' 'neovim')
source=("${_pkgname}::git+https://github.com/Rykka/${_pkgname}.py.git#commit=${_commit}")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  git log -1 --format="%cd" --date=short | tr -d '-'
}

build() {
  cd "${_pkgname}"

  python2 setup.py build
}

package() {
  cd "${_pkgname}"

  python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 cc=80 et:
