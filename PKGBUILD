# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Maintainer: dsche-cyber  <dsche-cyber@protonmail.com>

_pkgname=lightning-terminal
__pkgname=lit
pkgname=${_pkgname}-bin
pkgver=0.16.0_alpha.rc1
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
manifest-v${_pkgver}.txt.sig::"${url}/releases/download/v${_pkgver}/manifest-ViktorT-11-v${_pkgver}.sig"
"${url}/releases/download/v${_pkgver}/manifest-v${_pkgver}.txt"
)

sha256sums=('e94df86cfdf40e586530772ae3360c1d13ec3d48b2f3bf76371d8e684e2dac01'
            'SKIP'
            '339e5402cfb83f217d5e0c5dd9b6a0d11d0b273b2d73640b6ed291c1bada0ae8')

validpgpkeys=('26984CB69EB8C4A26196F7A4D7D916376026F177'
              '187F6ADD93AE3B0CF335AA6AB984570980684DCC'
              'F4FC70F07310028424EFC20A8E4256593F177720'
              'C20A78516A0944900EBFCA29961CC8259AE675D4')

package() {
    install -Dm 755 "${srcdir}/${_pkgname}-${_arch}-v${_pkgver}/${__pkgname}d" -t "${pkgdir}/usr/bin";
}

