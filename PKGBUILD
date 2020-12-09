# Maintainer: Loic Coyle <loic.coyle@hotmail.fr>

_pkgname=rofi-nordvpn
pkgname="${_pkgname}-git"
pkgver=r3.72bda44
pkgrel=1
pkgdesc='A script to manage nordvpn connections.'
arch=('any')
url='https://github.com/loiccoyle/rofi-nordvpn'
license=('MIT')
depends=('rofi' 'nordvpn-bin')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/loiccoyle/rofi-nordvpn.git")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"
  install -D -m 755 -t "${pkgdir}/usr/bin/" rofi-ttv
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${_pkgname}/" LICENSE
}
