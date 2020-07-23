# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Maintainer: b1f6c1c4 <b1f6c1c4@gmail.com>

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
  install -Dm755 "${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "${_pkgname}/${_pkgname}s" "${pkgdir}/usr/bin/${_pkgname}s"
  install -Dm644 "${_pkgname}/man/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
  install -Dm644 "${_pkgname}/man/${_pkgname}s.1" "${pkgdir}/usr/share/man/man1/${_pkgname}s.1"
  install -Dm644 "${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
