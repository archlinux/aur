# Maintainer: Loic Coyle <loic.coyle@hotmail.fr>

_pkgname=rofi-prowlet
pkgname="${_pkgname}-git"
pkgver=r4.dd271e2
pkgrel=1
pkgdesc='Rofi wrapper for prowlet, Use the Prowlarr search API to find torrents.'
arch=('any')
url='https://github.com/loiccoyle/rofi-prowlet'
license=('MIT')
depends=('jq' 'prowlet-git')
optdepends=('prowlarr: Usenet and torrent aggregator, similar to nzbhydra2 and jackett.')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/loiccoyle/rofi-prowlet.git")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"
  install -D -m 755 rofi-prowlet "${pkgdir}/usr/bin/rofi-prowlet"
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
