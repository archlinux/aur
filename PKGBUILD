# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=VHSgunzo
_pkgname=ssrv
pkgname=${_pkgname}-bin
pkgver=0.3.3
_pkgstr=ga5de203
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
sha256sums_x86_64=('a7b19837d62528fe1ef723ec408058cf315c9ce1ce589b99e0147c7992856f11')
sha256sums_i686=('61fe266d26563bcd5e320e7fd1934f55c831a3299ea2788447b250068f21d8bb')
sha256sums_aarch64=('5dca536d6cc0127f726c6bc0aa82610a0d16ac68242cd00994e5002ea7dce36e')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
