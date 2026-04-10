# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: dsche-cyber  <dsche-cyber@protonmail.com>

_pkgname=loop
pkgname=${_pkgname}-bin
pkgver=0.33.0_beta
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

sha256sums=('cf391bdd923d0ab8edbc89b8e593789bc5aebe936cd5e71ffb83fcd25f6a35a4'
            'SKIP'
            '5157bc29d465f4619be4c9f4cc74f72fe0e3a9b1e4c2da811e88590e379df5c2')

validpgpkeys=(
    'DE23E73BFA8A0AD5587D2FCDE80D2F3F311FD87E'
)

package() {
    install -Dm 755 "${srcdir}/${_pkgname}-${_arch}-v${_pkgver}/${_pkgname}" -t "${pkgdir}/usr/bin";
    install -Dm 755 "${srcdir}/${_pkgname}-${_arch}-v${_pkgver}/${_pkgname}d" -t "${pkgdir}/usr/bin";
}
