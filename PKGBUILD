# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=nccm-git
_gitname=${pkgname%-git}
pkgver=r41.b76a5bb
pkgrel=1
pkgdesc="NCurses ssh Connection Manager"
arch=('any')
url="https://github.com/flyingrhinonz/nccm"
license=('GPL3')
depends=('python-pyaml' 'yamllint')
makedepends=('git')
provides=("${_gitname}")
conflicts=("${_gitname}")
source=("git+https://github.com/flyingrhinonz/nccm")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${_gitname}

  install -Dm755 ${_gitname}/${_gitname} -t ${pkgdir}/usr/bin/
  install -Dm644 ${_gitname}/${_gitname}.yml -t ${pkgdir}/etc/
}

# vim: set sw=2 ts=2 et:
