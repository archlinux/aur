# Maintainer: Xavier Baez <xavierbaez@gmail.com>
_pkgname="move-to-previous-monitor"
pkgname="${_pkgname}"
pkgver=r21.1405add
pkgrel=1
pkgdesc="Move windows from one monitor to the previous"
arch=(any)
url="https://github.com/xavierbaez/move-to-previous-monitor"
license=('GPL-3.0-only')
depends=('bash' 'xdotool' 'wmctrl' 'xorg-xwininfo' )
source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"
  install -Dm755 "${_pkgname}" -t "$pkgdir/usr/bin"
}
