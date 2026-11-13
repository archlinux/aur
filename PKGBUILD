# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: dsche-cyber  <dsche-cyber@protonmail.com>

_pkgname=loop
pkgname=${_pkgname}-bin
pkgver=0.35.4_beta
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

sha256sums=('6ab0fc50fc1f61da4f2d1997a79f0d0c465a20ed379866241e56e54a79208b52'
            'SKIP'
            'cfb97164c1079d4fb357cad06f1d074e2624bd780b2d378a28751564ab20ecab')

validpgpkeys=(
    'DE23E73BFA8A0AD5587D2FCDE80D2F3F311FD87E'
    'E80D2F3F311FD87E'
)

package() {
    install -Dm 755 "${srcdir}/${_pkgname}-${_arch}-v${_pkgver}/${_pkgname}" -t "${pkgdir}/usr/bin";
    install -Dm 755 "${srcdir}/${_pkgname}-${_arch}-v${_pkgver}/${_pkgname}d" -t "${pkgdir}/usr/bin";
}
