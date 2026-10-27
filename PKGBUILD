# Maintainer: Dexanir <https://github.com/Dexanir>

pkgname=dtr
pkgver=1.1.1
pkgrel=1
pkgdesc='Human-friendly package-management wrapper for pacman, yay, and the AUR'
arch=('any')
url='https://github.com/Dexanir/dtr'
license=('GPL-3.0-only')
depends=('bash' 'pacman' 'sudo')
optdepends=(
  'yay: AUR package installation and upgrades'
  'python: AUR RPC queries when yay is unavailable'
  'git: direct AUR package fallback'
  'base-devel: direct AUR package builds'
  'pacman-contrib: precise package cache cleanup with paccache'
)
_commit='8cf2300bb7a4108f1e24ed6b42e4b53b70040514'
source=("${pkgname}-${pkgver}::https://raw.githubusercontent.com/Dexanir/dtr/${_commit}/dtr")
sha256sums=('c938bd11574e62f454d74244511f28979cd4028241bf8ce89701b628815a4e9c')

check() {
  bash -n "${srcdir}/${pkgname}-${pkgver}"
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/dtr"
}

