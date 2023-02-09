# Maintainer: Ranadeep B < mail at rnbguy dot at >

_orgname=sentinel
_ownername=${_orgname}-official
_reponame=hub
_pkgname=${_orgname}${_reponame}
pkgname=${_pkgname}-bin
pkgver=0.10.1
pkgrel=1
pkgdesc="The official Sentinel blockchain Hub"
arch=('x86_64')
url="https://github.com/${_ownername}/${_reponame}"
license=('Apache')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("https://raw.githubusercontent.com/${_ownername}/${_reponame}/v${pkgver}/LICENSE")
source_x86_64=("https://github.com/${_ownername}/${_reponame}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64")
sha256sums=('c55026df88ea80edee48ffd049972b4508a1ccd4efde124df603462cb9898f73')
sha256sums_x86_64=('75c5d788930c8a42fca33b08073618d6e6b364e234d19617a1be2a64c5d04e88')

package() {
    install -DT "${srcdir}/${_pkgname}-${pkgver}-linux-amd64" "${pkgdir}/usr/bin/${_pkgname}"
    install -m644 -Dt "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
}
