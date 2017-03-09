# Maintainer: Vincent Ambo <tazjin@gmail.com>

_pkgname=thunderbolt-icm-dkms
pkgname=thunderbolt-icm-dkms-git
pkgver=r2.2d1bd45
pkgrel=1
pkgdesc="DKMS Package for the thunderbolt ICM driver"
arch=('x86_64')
url="https://github.com/dell/thunderbolt-icm-dkms"
# No license file in repo yet, but see discussion on Github:
# https://github.com/dell/thunderbolt-icm-dkms/issues/1
license=('GPL2')
depends=('dkms')
optdepends=('linux-headers' 'linux-lts-headers')
source=('git+https://github.com/dell/thunderbolt-icm-dkms.git')
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  local dest="${pkgdir}/usr/src/${_pkgname}-${pkgver}"

  mkdir -p "${dest}"
  cp "${srcdir}/${_pkgname}/thunderbolt-icm"/* "${dest}"
}
