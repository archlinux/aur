# Maintainer: Luis Aranguren (pizzaman@hotmail.com)
# Contributor: dsche-cyber  <dsche-cyber@protonmail.com>

_pkgname=faraday
__pkgname=fr
pkgname=${_pkgname}-bin
pkgver=0.2.13_alpha
_pkgver="${pkgver//_/-}"
pkgrel=1
pkgdesc="Faraday is a suite of tools built to help node operators and businesses run lnd, the leading implementation of the Lightning Network."
arch=('any')
_arch=linux-amd64
url="https://github.com/lightninglabs/${_pkgname}"
license=("MIT")
depends=("lnd")
provides=("${_pkgname}" "${__pkgname}cli" )
source=(
"${url}/releases/download/v${_pkgver}/${_pkgname}-${_arch}-v${_pkgver}.tar.gz"
manifest-v${_pkgver}.txt.sig::"${url}/releases/download/v${_pkgver}/manifest-v${_pkgver}.sig"
"${url}/releases/download/v${_pkgver}/manifest-v${_pkgver}.txt"
)

sha256sums=('1b86881bcf726938c67bad5e645d781b9574dcb8c0e4dff53b4afa90ca0044d0'
            'SKIP'
            '7626b65a02ca84eeaa1e7126da1d7eff45d767a1f024646091bd34bd935427b5')

validpgpkeys=(
    'F4FC70F07310028424EFC20A8E4256593F177720')

package() {
    install -Dm 755 "${srcdir}/${_pkgname}-${_arch}-v${_pkgver}/${_pkgname}" -t "${pkgdir}/usr/bin";
    install -Dm 755 "${srcdir}/${_pkgname}-${_arch}-v${_pkgver}/${__pkgname}cli" -t "${pkgdir}/usr/bin";
}
