# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=nccm-git
_gitname=${pkgname%-git}
pkgver=r99.96af400
pkgrel=2
pkgdesc="NCurses ssh Connection Manager"
arch=('any')
url="https://github.com/flyingrhinonz/nccm"
license=('GPL3')
depends=('python-pyaml' 'yamllint')
makedepends=('git')
provides=("nccm")
conflicts=("nccm")
backup=('etc/nccm.yml')
source=("git+https://github.com/flyingrhinonz/nccm")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${_gitname}

  install -Dm755 ${_gitname}/nccm -t ${pkgdir}/usr/bin/
  install -Dm644 ${_gitname}/nccm.yml -t ${pkgdir}/etc/
}

# vim: set sw=2 ts=2 et:
