# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='bpytop'
pkgname="${_pkgname}-git"
pkgver=r226.adee413
pkgrel=1
pkgdesc='Resource monitor that shows usage and stats for processor, memory, disks, network and processes'
arch=('any')
url='https://github.com/aristocratos/bpytop'
license=('APACHE')
depends=('python-psutil')
makedepends=('git' 'python-setuptools')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"
  install -Dvm755 "${_pkgname}.py" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dvm644 'themes/'* -t "${pkgdir}/usr/share/${_pkgname}/themes"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
}

# vim: ts=2 sw=2 et:
