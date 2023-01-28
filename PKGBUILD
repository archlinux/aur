# Maintainer: dreieck

_pkgname=amule-daemon-provides
pkgname="${_pkgname}"
epoch=0
pkgver=2.3.3
pkgrel=1

pkgdesc="Metapackage: Depends on 'amule' makes it provide the 'amule-damon'-dependency (with \$pkgver automatically bumped to the one if the installed 'amule' during build)."
url="http://www.amule.org"
license=('GPL')

arch=(
  'any'
)

depends=(
  "amule"
)
makedepends=()
optdepends=()
provides=(
  "amule-daemon=${pkgver}"
)
replaces=()
conflicts=(
  "amule-daemon"
)

options=('emptydirs')

source=()
sha256sums=()

pkgver() {
  LC_ALL=C
  LANG=C
  export LC_ALL
  export LANG
  pacman -Q amule | cut -d ' ' -f 2 | sed -E 's|^.*:||g' | sed -E 's|-.*||'
}

package() {
  true
}
