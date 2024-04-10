# Maintainer: Ranadeep B < mail at rnbguy dot at >

pkgname=quint
_orgname=informalsystems
_pkgname="@${_orgname}/${pkgname}"
pkgver=0.19.2
pkgrel=1
pkgdesc="Quint is an executable specification language with design and tooling focused on usability. It is based on the Temporal Logic of Actions"
arch=('any')
url="https://github.com/${_orgname}/${pkgname}"
license=('Apache')
provides=(${pkgname})
conflicts=(${pkgname})
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${_pkgname}/-/${pkgname}-${pkgver}.tgz"
        "https://github.com/${_orgname}/${pkgname}/raw/v${pkgver}/LICENSE")
sha256sums=('aedb74a0c4342ca2d97aca5e86201ce56fded872ac4a8d40d303cc10d8da9665'
            '0f8c4f9a99d4861ee62ade9a9526d09570844bdeab3e6bca500383d5ae7d9495')

package() {
    npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${pkgname}-${pkgver}.tgz"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
