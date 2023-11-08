# Maintainer: 7Ji <pugokushin@gmail.com>

pkgname=git-mirrorer
pkgver=1.0.1
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
  '58b29ee087c21abce67b861ffd9d3daa8c92c2ae3b229bb96a9130107f529280'
)

build() {
  cd "${_srcname}"
  make "VERSION=${pkgver}-ArchLinux-${pkgrel}"
}

package() {
  install -Dm755 "${srcdir}/${_srcname}/${pkgname}" -t "${pkgdir}/usr/bin/"
}