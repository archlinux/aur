# Maintainer: a172 <spartan074 _at_ gmail dot com>

pkgname=udiskie-dmenu-git
_gitroot='udiskie-dmenu'
epoch=1
pkgver=0.3.0.r10.0b538f9
pkgrel=1
pkgdesc='manage removable devices via dmenu (or rofi)'
arch=('any')
url="https://github.com/fogine/${_gitroot}"
license=('MIT')
depends=('udiskie' 'dmenu' 'nodejs' 'libnotify')
optdepends=('rofi: use rofi as the front-end')
makedepends=('git')
conflicts=()
provides=()
source=("git+https://github.com/fogine/${_gitroot}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitroot}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
  cd "${srcdir}/${_gitroot}"
  install ${_gitroot} -D "${pkgdir}/usr/bin/${_gitroot}"
}
