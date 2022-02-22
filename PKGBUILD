# Maintainer: Thibaut Pérami <thibaut.perami@cl.cam.ac.uk>
_pkgname="move-to-next-monitor"
pkgname="${_pkgname}-git"
pkgver=r18.68e3ca6
pkgrel=1
pkgdesc="Move windows from one monitor to the next"
arch=(any)
url="https://github.com/jc00ke/move-to-next-monitor"
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
