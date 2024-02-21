# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_pkgname=ledger-udev
pkgname="${_pkgname}-git"
pkgver=r16.f474382
pkgrel=1
pkgdesc='Udev rules to support Ledger devices on Linux (git-latest)'
arch=('any')
url='https://github.com/LedgerHQ/udev-rules'
license=('Apache')
depends=('udev')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="${_pkgname}.install"
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

package() {
  cd "${pkgname}"
  install -Dm 644 "20-hw1.rules" "${pkgdir}/usr/lib/udev/rules.d/20-hw1.rules"
}

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
