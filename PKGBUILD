# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: 2ion <dev@2ion.de>
pkgname=bunsen-utilities-git
pkgver=r741.28dd596
pkgrel=3
pkgdesc="Small scripts to use with BunsenLabs."
arch=('any')
url="https://github.com/BunsenLabs/bunsen-utilities"
license=('GPL-3.0-or-later')
depends=(
# upstream
'bunsen-common'
'gtk3'
'libnotify'
'python3'
'python-gobject'
'python-lxml'
'python-psutil'
'python-xdg'
'python-xlib'
'wmctrl'
'xdotool'
'yad'
# namcap
'bash'
)
optdepends=(\
  'upower: Required for bl-exit' \
  'zenity: Required bl-conkyzen and bl-tint2edit')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/BunsenLabs/bunsen-utilities.git#branch=boron")
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -d "${pkgdir}/usr/bin"
  install -t "${pkgdir}/usr/bin" bin/bl-*
}
