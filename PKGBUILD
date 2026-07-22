# Maintainer: Dexanir <https://github.com/Dexanir>

pkgname=dtr
pkgver=1.1.0
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
_commit='703e9929d5af9e66c088c0f6a80bfda8fe433264'
source=("${pkgname}-${pkgver}::https://raw.githubusercontent.com/Dexanir/dtr/${_commit}/dtr")
sha256sums=('4f1c93892a067b2fc6e46a219ce5b71b8cb463633aa14e5ca62acc468d8de4f1')

check() {
  bash -n "${srcdir}/${pkgname}-${pkgver}"
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/dtr"
}

