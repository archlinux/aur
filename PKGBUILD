# Maintainer: Ranadeep B < mail at rnbguy dot at >
# Contributor: Ranadeep B < mail at rnbguy dot at >

pkgname=quint
_orgname=informalsystems
_pkgname="@${_orgname}/${pkgname}"
pkgver=0.23.0
pkgrel=1
pkgdesc="An executable specification language with design and tooling focused on usability. It is based on the Temporal Logic of Actions"
arch=('any')
url="https://github.com/${_orgname}/${pkgname}"
license=('Apache')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${_pkgname}/-/${pkgname}-${pkgver}.tgz"
        "https://github.com/${_orgname}/${pkgname}/raw/v${pkgver}/LICENSE")
sha256sums=('7fc1303041cb1c7edea198b819a581b3aeb34f7291e9ec814736791af6ac2d0e'
            '0f8c4f9a99d4861ee62ade9a9526d09570844bdeab3e6bca500383d5ae7d9495')

package() {
    npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${pkgname}-${pkgver}.tgz"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
