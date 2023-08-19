# Maintainer: noobping <hello@noobping.dev>

pkgname=wofi-pass-git
_pkgname=${pkgname%-git}
pkgver=VERSION
pkgrel=1
pkgdesc="A Wayland-native interface for conveniently using pass"
arch=('any')
url='https://github.com/schmidtandreas/wofi-pass'
license=('GPL')
depends=('coreutils' 'findutils' 'grep' 'man-pages' 'pass' 'tcl' 'util-linux' 'wl-clipboard' 'wofi')
optdepends=(
  'wtype: type support'
  'pass-otp: OTP support')
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
