# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='sshto'
pkgname="${_pkgname}-git"
pkgver=r127.ef4b8dc
pkgrel=1
pkgdesc='TUI to manage your ssh connections'
arch=('any')
url='https://github.com/vaniacer/sshto'
license=('MIT')
depends=('dialog' 'openssh')
makedepends=('git')
provides=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"
  install -Dm755 -t "${pkgdir}/usr/bin" "${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
  install -Dm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
