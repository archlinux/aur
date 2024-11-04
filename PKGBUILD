# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Maintainer: dsche-cyber  <dsche-cyber@protonmail.com>

_pkgname=lightning-terminal
__pkgname=lit
pkgname=${_pkgname}-bin
pkgver=0.13.6_alpha
_pkgver="${pkgver//_/-}"
pkgrel=1
pkgdesc="Lightning Terminal (LiT) is a browser-based interface for managing channel liquidity."

arch=('any')
_arch=linux-amd64

url="https://github.com/lightninglabs/${_pkgname}"
license=("MIT")
optdepends=("frcli" "lncli" "lnd" "loop" "pool")
provides=("${__pkgname}d")

source=(
${_pkgname}-${_arch}-v${_pkgver}.tar.gz::"${url}/releases/download/v${_pkgver}/${_pkgname}-${_arch}-v${_pkgver}.tar.gz"
manifest-v${_pkgver}.txt.sig::"${url}/releases/download/v${_pkgver}/manifest-v${_pkgver}.sig"
"${url}/releases/download/v${_pkgver}/manifest-v${_pkgver}.txt"
)

sha256sums=('d49fc850913705a5ee2d1849d0a6507d9ace26c6b8243be5c8fa6290a863c4a4'
            'SKIP'
            '5210a86ef9bd7e93248f4f9c052fd044e862812ac0c98a0500c71841b9e74c13')

validpgpkeys=('26984CB69EB8C4A26196F7A4D7D916376026F177'
              '187F6ADD93AE3B0CF335AA6AB984570980684DCC')
package() {
    install -Dm 755 "${srcdir}/${_pkgname}-${_arch}-v${_pkgver}/${__pkgname}d" -t "${pkgdir}/usr/bin";
}

