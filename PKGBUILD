# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: dsche-cyber  <dsche-cyber@protonmail.com>

_pkgname=pool
pkgname=${_pkgname}-bin
pkgver=0.6.4_beta
_pkgver="${pkgver//_/-}"
pkgrel=1
pkgdesc="Lightning Pool: a non-custodial batched uniform clearing-price auction for Lightning Channel Leases (LCL). An LCL packages up inbound channel liquidity (ability to receive funds) as a fixed income asset with a maturity date expressed in blocks."
arch=('any')
_arch=linux-amd64
url="https://github.com/lightninglabs/${_pkgname}"
license=("MIT")
depends=("lnd")
provides=("${_pkgname}" "${_pkgname}d")

source=(
"${url}/releases/download/v$_pkgver/${_pkgname}-${_arch}-v${_pkgver}.tar.gz"
manifest-v${_pkgver}.txt.sig::"${url}/releases/download/v${_pkgver}/manifest-v${_pkgver}.sig"
"${url}/releases/download/v${_pkgver}/manifest-v${_pkgver}.txt"
)

sha256sums=('ced3f23b6904ac8f4805afc20ac7c859912ae3ffca3c65f7280215b083da7af2'
            'SKIP'
            'ffd4cdf803eb26be20aa9ebb4312e2c49c449902bd5f48626dfa0c2adda0e406')

validpgpkeys=('F4FC70F07310028424EFC20A8E4256593F177720')

package() {
    install -Dm 755 "${srcdir}/${_pkgname}-${_arch}-v${_pkgver}/${_pkgname}" -t "${pkgdir}/usr/bin";
    install -Dm 755 "${srcdir}/${_pkgname}-${_arch}-v${_pkgver}/${_pkgname}d" -t "${pkgdir}/usr/bin";
}
