# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: dsche-cyber  <dsche-cyber@protonmail.com>

_pkgname=loop
pkgname=${_pkgname}-bin
pkgver=0.34.0_beta
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

sha256sums=('96edaea39be09c01e79a8ae827e1f1444867c49e5df873dfe5d3868dce6beda3'
            'SKIP'
            '407f440a5f5e5c3c35ee1f7db120b3d4a128429b1ab079b0764ca1ace927cbe3')

validpgpkeys=(
    'DE23E73BFA8A0AD5587D2FCDE80D2F3F311FD87E'
)

package() {
    install -Dm 755 "${srcdir}/${_pkgname}-${_arch}-v${_pkgver}/${_pkgname}" -t "${pkgdir}/usr/bin";
    install -Dm 755 "${srcdir}/${_pkgname}-${_arch}-v${_pkgver}/${_pkgname}d" -t "${pkgdir}/usr/bin";
}
