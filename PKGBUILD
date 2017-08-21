# Maintainer: JumperPunk <spartan074 _at_ gmail dot com>

pkgname=udiskie-dmenu-git
_gitroot='udiskie-dmenu'
pkgver=9.451ec99
pkgrel=2
pkgdesc='manage removable devices via dmenu (or rofi)'
arch=('any')
url="https://github.com/fogine/${_gitroot}"
license=('MIT')
depends=('udiskie' 'dmenu' 'nodejs' 'libnotify')
optdepends=('rofi: use rofi as the front-end')
makedepends=('git')
conflicts=()
provides=()
source=("git://github.com/fogine/${_gitroot}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitroot}"
  echo "$(git rev-list --count HEAD).$(git describe --always)"
}

package() {
  cd "${srcdir}/${_gitroot}"
  install ${_gitroot} -D "${pkgdir}/usr/bin/${_gitroot}"
}
