# Maintainer: Mark Collins <tera_1225 [aaht] hotmail ðot com>
pkgname=pacman-hook-aur-set-notifications
_name=aur-set-notifications
pkgver="0.1.3"
pkgrel=1
pkgdesc="toggle status of notifications for AUR packages on (un|)installation"
arch=(any)
url="https://gitlab.com/Marcool04/$pkgname"
license=('GPL-3.0-or-later')
depends=(
  'bash'
  'curl'
  'jq'
  'pacman'
  'ripgrep'
)
backup=('etc/aur_credentials.conf')
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.zip")
sha256sums=('980b92608631c685b437695151b188e350071e61a97dd7235ce4397a4837d57f')

package() {
  cd "${srcdir}/${pkgname}-v$pkgver"
  install -v -Dm755 "${_name}.sh" -t "${pkgdir}/usr/share/libalpm/scripts/"
  install -v -Dm644 "${_name}-on.hook" -t "${pkgdir}/usr/share/libalpm/hooks/"
  install -v -Dm644 "${_name}-off.hook" -t "${pkgdir}/usr/share/libalpm/hooks/"
  install -v -Dm600 "aur_credentials.conf" -t "${pkgdir}/etc/"
}
