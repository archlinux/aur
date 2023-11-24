# Maintainer: Luis Aranguren (pizzaman@hotmail.com)
# Contributor: dsche-cyber  <dsche-cyber@protonmail.com>

_pkgname=faraday
__pkgname=fr
pkgname=${_pkgname}-bin
pkgver=0.2.11_alpha
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

sha256sums=('892d1bbbc194ec3649af7b4e8298d034d84b6a379b3c2e943c16082911e0f894'
            'SKIP'
            '0066409f4db00e370974a60771302114a5b58aba120722c907f7e111442073b3')

validpgpkeys=(
    'F4FC70F07310028424EFC20A8E4256593F177720')

package() {
    install -Dm 755 "${srcdir}/${_pkgname}-${_arch}-v${_pkgver}/${_pkgname}" -t "${pkgdir}/usr/bin";
    install -Dm 755 "${srcdir}/${_pkgname}-${_arch}-v${_pkgver}/${__pkgname}cli" -t "${pkgdir}/usr/bin";
}
