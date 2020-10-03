# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='bashmount'
pkgname="${_pkgname}-git"
pkgver=0.43.r17.g1f75f01
pkgrel=1
pkgdesc='Tool to mount and unmount removable media from the command-line'
arch=('any')
url='https://github.com/jamielinux/bashmount'
license=('GPL2')
makedepends=('git')
optdepends=('udisks2: manage removable media without sudo')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=("etc/${_pkgname}.conf")
source=("git+${url}.git")
sha256sums=('SKIP')

package() {
  cd "${_pkgname}"
  install -Dm755 -t "${pkgdir}/usr/bin" "${_pkgname}"
  install -Dm755 -t "${pkgdir}/etc" "${_pkgname}.conf"
  install -Dm644 -t "${pkgdir}/usr/share/man/man1" "${_pkgname}.1"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
}

# vim: ts=2 sw=2 et:
