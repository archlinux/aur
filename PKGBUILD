# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: dsche-cyber  <dsche-cyber@protonmail.com>

_pkgname=loop
pkgname=${_pkgname}-bin
pkgver=0.31.2_beta
_pkgver="${pkgver//_/-}"
pkgrel=1
pkgdesc="Lightning Loop is a non-custodial service offered by Lightning Labs that makes it easy to move bitcoin into and out of the Lightning Network."
arch=('any')
_arch=linux-amd64
url="https://github.com/lightninglabs/${_pkgname}"
license=("MIT")
depends=("lnd")
provides=("${_pkgname}" "${_pkgname}d")

source=(
"${url}/releases/download/v$_pkgver/${_pkgname}-${_arch}-v${_pkgver}.tar.gz"
manifest-v${_pkgver}.txt.sig::"${url}/releases/download/v${_pkgver}/manifest-v${_pkgver}.txt.sig"
"${url}/releases/download/v${_pkgver}/manifest-v${_pkgver}.txt"
)

sha256sums=('cc188ddf94ef8c0db3e4d16b94d4499400615c1c7e3984f92e7f1a5e356f4388'
            'SKIP'
            '4422886be4c99e8e98aa89317cdc12e1e22e7f7bd57aad72385675924eb3ced6')

validpgpkeys=(
    'DE23E73BFA8A0AD5587D2FCDE80D2F3F311FD87E'
)

package() {
    install -Dm 755 "${srcdir}/${_pkgname}-${_arch}-v${_pkgver}/${_pkgname}" -t "${pkgdir}/usr/bin";
    install -Dm 755 "${srcdir}/${_pkgname}-${_arch}-v${_pkgver}/${_pkgname}d" -t "${pkgdir}/usr/bin";
}
