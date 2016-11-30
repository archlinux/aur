# vim: set ts=2 sw=2 sts=2 sta et :
# Maintainer: Jeremy Asuncion <jeremyasuncion808@gmail.com>
pkgname=refind-theme-regular-git
pkgver=r26.3e2f6ac
pkgrel=1
pkgdesc="A simplistic clean and minimal theme for rEFInd"
arch=(any)
url="https://github.com/munlik/refind-theme-regular"
license=('AGPL3' 'custom:OFL' 'custom:Ubuntu Font License 1.0')
depends=('refind-efi')
makedepends=('git')
source=('git+https://github.com/munlik/refind-theme-regular')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  REFIND_HOME="${pkgdir}/boot/EFI/refind"

  mkdir -p "${REFIND_HOME}"
  cp -r "${srcdir}/${pkgname%-git}" "${REFIND_HOME}"
  chmod -R 644 "${REFIND_HOME}/${pkgname%-git}"

  echo 'Remember to add "include refind-theme-regular/theme.conf" to your refind.conf file'
}
