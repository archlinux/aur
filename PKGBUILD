# Maintainer: Sam Whited <sam@samwhited.com>

_pkgname=idnits
pkgname="ietf-${_pkgname}"
pkgver='3.0.0'
_alpharel=74
pkgrel=1
pkgdesc='Check internet-drafts for submission nits'
arch=('any')
url='https://author-tools.ietf.org/idnits3/'
license=('BSD-3-Clause')
depends=()
makedepends=(
  'npm'
  'jq'
)

source=("https://github.com/ietf-tools/${_pkgname}/archive/refs/tags/${pkgver}-alpha.${_alpharel}.tar.gz")
sha256sums=('6d0f0c74585f15e3c8a8bb49908b44c4fa58f42bac9d4c6ab0824d6906e4b473')
noextract=("${pkgver}-alpha.${_alpharel}.tar.gz")

package() {
  npm install --cache "${srcdir}/npm-cache" -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgver}-alpha.${_alpharel}.tar.gz"
}

# vim: ts=2 sw=2 et:
