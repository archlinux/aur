# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=VHSgunzo
_pkgname=ssrv
pkgname=${_pkgname}-bin
pkgver=0.3.2
_pkgstr=gfebc9d3
pkgrel=1
pkgdesc='Shell server/client'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-v${pkgver}.r0.${_pkgstr}-tls.tar.zst")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}-i386-v${pkgver}.r0.${_pkgstr}-tls.tar.zst")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-aarch64-v${pkgver}.r0.${_pkgstr}-tls.tar.zst")
sha256sums=('39f388e52094ccc94bf793a75c8021fb673fcff2b8e10c316501c9d09ad8cd1a'
            '74161ac6404007c250caf8ec1556ddb6bbee99b0ac3e18d8616419ca7d7c1d6a')
sha256sums_x86_64=('16e7b0018cfa36a2ac5702fae5d0d17f5cdb0278a1c77d1020f4be4d8e8b0351')
sha256sums_i686=('f375f0e0a370cb2bc4ad69103e1f009685534669fdd37a1572124b8e7e15ee1b')
sha256sums_aarch64=('96d9c3f0e18bc00224a74607e2417d9fdd88ef9fc73909c0f90e83ec40138238')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
