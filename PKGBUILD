# Maintainer: Ranadeep B < mail at rnbguy dot at >

_orgname=sentinel
_ownername=${_orgname}-official
_reponame=hub
_pkgname=${_orgname}${_reponame}
pkgname=${_pkgname}-bin
pkgver=0.8.3
pkgrel=1
pkgdesc="The official Sentinel blockchain Hub"
arch=('x86_64')
url="https://github.com/${_ownername}/${_reponame}"
license=('Apache')
provides=(${_pkgname})
conflicts=(${_pkgname})
source_x86_64=("https://github.com/${_ownername}/${_reponame}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64"
               "https://raw.githubusercontent.com/${_ownername}/${_reponame}/v${pkgver}/LICENSE")
sha256sums_x86_64=('2250a4336aeb3fe594de845f7176229420549e69f066a803cb803579207891ca'
                   'c55026df88ea80edee48ffd049972b4508a1ccd4efde124df603462cb9898f73')

package() {
    install -DT "${srcdir}/${_pkgname}-${pkgver}-linux-amd64" "${pkgdir}/usr/bin/${_pkgname}"
    install -m644 -Dt "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
}
