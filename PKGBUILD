# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Florian B. gn0mish@protonmail.com

pkgname="powerline-shell-git"
_pkgname="powerline-shell"
pkgver=r588.4b19aa4
pkgrel=1
pkgdesc="A pretty prompt for your shell"
arch=("any")
_giturl="://github.com/b-ryan/powerline-shell"
url="https${_giturl}"
license=("MIT")
provides=("${_pkgname}")
depends=("python")
makedepends=(
  "git" "python-setuptools"
)
source=(
  "git+http${_giturl}.git"
)
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
