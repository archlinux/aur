# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: b1f6c1c4 <b1f6c1c4@gmail.com>

_pkgname=git-get
pkgname=${_pkgname}-git
pkgver=0.0.r2.ge822073
pkgrel=1
pkgdesc='Blazingly fast, incredibly handy git clone alternative'
arch=('any')
url='https://github.com/b1f6c1c4/git-get'
license=('MIT')
depends=('git')
makedepends=('git')
provides=("${_pkgname}")
options=('zipman')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd ${_pkgname}
  install -Dm755 -t "${pkgdir}/usr/bin" "${_pkgname}"{,s}
  install -Dm644 -t "${pkgdir}/usr/share/man/man1" "man/${_pkgname}"{,s}.1
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" 'LICENSE'
}

# vim: ts=2 sw=2 et:
