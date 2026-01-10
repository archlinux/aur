# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgname=udiskie-dmenu-git
_gitroot='udiskie-dmenu'
epoch=1
pkgver=0.3.0.r15.61d7642
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
source=(
  "git+https://github.com/fogine/${_gitroot}.git"
  udiskie.desktop
)
md5sums=('SKIP'
         '45ccbe4fdfbdf3ad9a054ea391a10b3a')

pkgver() {
  cd "${srcdir}/${_gitroot}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
  install udiskie.desktop -D -t "${pkgdir}/usr/share/applications"
  install "${srcdir}/${_gitroot}/${_gitroot}" -D "${pkgdir}/usr/bin/${_gitroot}"
}
