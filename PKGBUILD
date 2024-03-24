# Maintainer:       dreieck
# Contributor:      @joshskidmore <josh@josh.sc>
# Contributor:      @sigboe <sig.boe@gmail.com>
# Contributor:      @chrisaw <home@chrisaw.com>
# Contributor:      @njkli <voobscout@archlinux.info>
# Original Source:  https://github.com/njkli/gpd-pocket/tree/master/gpd-pocket-support

_pkgname=gpd-pocket-support-bcm4356
pkgname="${_pkgname}-git"
pkgver=0.2.5
pkgrel=4
pkgdesc="Provides an additionally needed firmware file brcmfmac4356-pcie.txt for the Broadcom BCM4356 WiFi in the GPD Pocket. (If you have 'gpd-pocket-support' installed you already have this.)"
arch=('any')
url='https://github.com/joshskidmore/gpd-pocket-arch-packages/tree/master/gpd-pocket-support'
license=('MIT')
depends=()
optdepends=()
provides=(
  "${_pkgname}=${pkgver}"
)
replaces=(
  "${_pkgname}<${pkgver}"
)
conflicts=(
  'gpd-pocket-support'
  "${_pkgname}"
)
source=(
  'gpd-pocket-arch-packages::git+https://github.com/joshskidmore/gpd-pocket-arch-packages'
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/gpd-pocket-arch-packages/gpd-pocket-support"
  grep -E '[[:space:]]*pkgver=' PKGBUILD | sed 's|#.*$||' | sed -E 's|[[:space:]]*$||' | awk -F '=' '{print $2}'
}

package() {
  cd "${srcdir}/gpd-pocket-arch-packages/gpd-pocket-support"
  install -v -D -m0644 "brcmfmac4356-pcie.txt" "${pkgdir}/usr/lib/firmware/brcm/brcmfmac4356-pcie.txt"
}
