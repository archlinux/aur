# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Maintainer: dsche-cyber  <dsche-cyber@protonmail.com>

_pkgname=lightning-terminal
__pkgname=lit
pkgname=${_pkgname}-bin
pkgver=0.15.0_alpha.rc1
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

sha256sums=('c275c53ea51dd2008117353ed6d7136bf8453934143c9aa9d967e81f912e4071'
            'SKIP'
            'b4a4a99f748092a10d2ef8f68a77c478d9b346992685b190a94b5f956b205c3b')

validpgpkeys=('26984CB69EB8C4A26196F7A4D7D916376026F177'
              '187F6ADD93AE3B0CF335AA6AB984570980684DCC'
              'F4FC70F07310028424EFC20A8E4256593F177720')
package() {
    install -Dm 755 "${srcdir}/${_pkgname}-${_arch}-v${_pkgver}/${__pkgname}d" -t "${pkgdir}/usr/bin";
}

