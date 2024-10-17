# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
# Co-Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=harakeishi
_pkgname=whris
pkgname=${_pkgname}-bin
pkgver=0.1.48
pkgrel=1
pkgdesc='Displays management information for IPs associated with the domain.'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_i386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_arm64.tar.gz")
sha256sums=('1d6483a11c94d7bc6e331ecd6befbbb69a3344a44266a1a0c76b5441aff0f23d'
            'fbf11548081cf20f85ed235eb527c6a0ee215e9fd894bd86482771a552d0f2cd')
sha256sums_x86_64=('81b83d7b1afeda7cd278a21a3ebde1a9d97b2010a37d5cd80bb84cc62699198a')
sha256sums_i686=('055bdc180de392b74701436ff321ed66678801b7e1ba75c29b351ae4f01b0b5d')
sha256sums_aarch64=('53b9dc5602426c3901bdfe9c4fb4f14c6de0328f8f14275bf777576f5f4e1c0c')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
