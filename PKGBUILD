# Maintainer: Sam Whited <sam@samwhited.com>

_pkgname=idnits
pkgname="ietf-${_pkgname}"
pkgver='3.1.0'
pkgrel=1
pkgdesc='Check internet-drafts for submission nits'
arch=('any')
url='https://author-tools.ietf.org/idnits3/'
license=('BSD-3-Clause')
depends=(
  'nodejs'
)
makedepends=(
  'npm'
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ietf-tools/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('80a60387bac954fbbd1a4e1099492bfc2eba081b7776ecf7fadf11ba2dafed85')
noextract=("${pkgname}-${pkgver}.tar.gz")

package() {
  npm install --cache "${srcdir}/npm-cache" -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tar.gz"
}

# vim: ts=2 sw=2 et:
