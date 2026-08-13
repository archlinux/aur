# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=jpillora
_pkgname=sshd-lite
pkgname=${_pkgname}-bin
pkgver=1.51.0
pkgrel=1
pkgdesc='A feature-light sshd(8) for Windows, Mac, and Linux'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')
license=('MIT')

conflicts=("${_pkgname}")
provides=("${_pkgname}")

options=('!strip')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_${_barch[0]}.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_${_barch[1]}.gz")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_${_barch[2]}.gz")

sha256sums=('048b252033c0c357931c3fd0619b978b05a3e51700b55d61cb1cedddaf997f89'
            'f40c746ad8e584bc450b3e9cc7a83731bc85346f049ba409ce74981326376188')
sha256sums_x86_64=('6680352faa054ab0d236a3fdccdde47c60e18d5f631d088d99b1545c39b3a879')
sha256sums_i686=('29cc1620b9348f65a811064b48fbce9a8efa8b7aa53374f5aaa3ece34a531724')
sha256sums_aarch64=('63d86f5ade469fa05c2dee6c5c49310e0529bcaf6860b7db918a8daffd1eb421')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
