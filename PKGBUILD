# Maintainer: Luis Aranguren (pizzaman@hotmail.com)
# Contributor: dsche-cyber  <dsche-cyber@protonmail.com>

_pkgname=faraday
__pkgname=fr
pkgname=${_pkgname}-bin
pkgver=0.2.14_alpha
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

sha256sums=('26b113af01a2b873854995c3d0948576154cf587b656bd550c3e3e65191b2974'
            'SKIP'
            'd17e504e97cc0cd671c05c5f5ddab26dc681d8f7d60605eca90e0ac445f7791b')

validpgpkeys=(
    'F4FC70F07310028424EFC20A8E4256593F177720')

package() {
    install -Dm 755 "${srcdir}/${_pkgname}-${_arch}-v${_pkgver}/${_pkgname}" -t "${pkgdir}/usr/bin";
    install -Dm 755 "${srcdir}/${_pkgname}-${_arch}-v${_pkgver}/${__pkgname}cli" -t "${pkgdir}/usr/bin";
}
