# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='ssh-tools'
pkgname="${_pkgname}-git"
pkgver=1.6.r6.gfba194d
pkgrel=1
pkgdesc='Tools for ssh'
arch=('any')
url='https://github.com/vaporup/ssh-tools'
license=('GPL3')
depends=('openssh')
makedepends=('git')
optdepends=("colordiff: colors for ssh-diff")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${_pkgname}"
  install -Dm755 -t "${pkgdir}/usr/bin" 'ssh-'*
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
}

# vim: ts=2 sw=2 et:
