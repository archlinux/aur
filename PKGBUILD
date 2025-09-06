# Maintainer: Byeol <stella@writteninbyeol.com>
pkgname=kronos-cli-git
_pkgname=kronos
pkgver=0
pkgrel=1
pkgdesc="Reliable, parallel, checksum-verified file transfers over SSH with one simple command."
arch=('any')
url="https://github.com/stella-etoile/kronos"
license=('MIT')
depends=('rsync' 'rclone' 'openssh' 'coreutils')
makedepends=('git')
provides=("${_pkgname}-cli")
conflicts=("${_pkgname}-cli")
source=("git+${url}#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
