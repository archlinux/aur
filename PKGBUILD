# Maintainer: 7Ji <pugokughin@gmail.com>

pkgname=ampart
pkgver=1.3
pkgrel=1
pkgdesc="A partition tool to modify Amlogic's proprietary eMMC partition format and FDT"
arch=('x86_64' 'aarch64')
url="https://github.com/7Ji/${pkgname}"
license=('GPL3')
depends=('glibc' 'zlib')
makedepends=('gcc')
_srcname="${pkgname}-${pkgver}"
source=(
  "${_srcname}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
  '64cbb3f83a8a4e1cd021891f0b1f20e21f2f6d7e00016112907e884dff37089c'
)

build() {
  cd "${srcdir}/${_srcname}"
  make "VERSION_CUSTOM=${pkgver}-ArchLinux-${pkgrel}"
}

package() {
  install -Dm755 "${srcdir}/${_srcname}/${pkgname}" -t "${pkgdir}"/usr/bin/
}
