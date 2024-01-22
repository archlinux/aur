# Maintainer: 7Ji <pugokushin@gmail.com>

pkgname=git-mirrorer
pkgver=1.0.2
pkgrel=1
pkgdesc="To mirror git repos, and archive and checkout them with submodules included implicitly."
arch=('x86_64' 'aarch64')
url="https://github.com/7Ji/${pkgname}"
license=('AGPL3')
depends=('libgit2' 'libyaml' 'xxhash')
_srcname="${pkgname}-${pkgver}"
source=(
  "${_srcname}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
  '79ccd131d88df50664c7d3dee1a061343020dad038e94c174ac45cdf87ce4b0c'
)

build() {
  cd "${_srcname}"
  make "VERSION=${pkgver}-ArchLinux-${pkgrel}"
}

package() {
  install -Dm755 "${srcdir}/${_srcname}/${pkgname}" -t "${pkgdir}/usr/bin/"
}