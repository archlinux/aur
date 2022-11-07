# Maintainer: Ruben Garcia <rssanjuan2704@gmail.com>

_pkgname=rofi-expressvpn
pkgname="${_pkgname}-git"
pkgver=r1.75793ce
pkgrel=1
pkgdesc='A script that generates a rofi menu to control ExpressVPN.'
arch=('any')
url='https://github.com/sigfriedcub1990/rofi-expressvpn'
license=('GPL-3.0')
depends=('rofi' 'gawk' 'expect')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/sigfriedcub1990/rofi-expressvpn.git")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"
  install -D -m 755 -t "${pkgdir}/usr/bin/" rofi-expressvpn
  install -D -m 755 -t "${pkgdir}/usr/bin/" activate-vpn
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${_pkgname}/" LICENSE
}
