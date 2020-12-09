# Maintainer: Loic Coyle <loic.coyle@hotmail.fr>

_pkgname=rofi-ttv
pkgname="${_pkgname}-git"
pkgver=r24.177099
pkgrel=1
pkgdesc='A script that uses rofi, youtube-dl and mpv to view twitch streams.'
arch=('any')
url='https://github.com/loiccoyle/rofi-ttv'
license=('MIT')
depends=('curl' 'jq' 'rofi' 'youtube-dl' 'mpv')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/loiccoyle/rofi-ttv.git")
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
