# Maintainer: Loic Coyle <loic.coyle@hotmail.fr>

_pkgname=rofi-cuff
pkgname="${_pkgname}-git"
pkgver=r19.80a0d84
pkgrel=1
pkgdesc='Rofi wrapper for cuff, Use the Jackett search API to find torrents.'
arch=('any')
url='https://github.com/loiccoyle/rofi-cuff'
license=('MIT')
depends=('jq' 'cuff')
optdepends=('jackett: Use many torrent trackers with software that supports torznab/potato feeds.')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/loiccoyle/rofi-cuff.git")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"
  install -D -m 755 rofi-cuff "${pkgdir}/usr/bin/rofi-cuff"
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
