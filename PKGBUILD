# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=VHSgunzo
_pkgname=ssrv
pkgname=${_pkgname}-bin
pkgver=0.3.1
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
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-v${pkgver}.r0.g611bdef-tls.tar.zst")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}-i386-v${pkgver}.r0.g611bdef-tls.tar.zst")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-aarch64-v${pkgver}.r0.g611bdef-tls.tar.zst")
sha256sums=('39f388e52094ccc94bf793a75c8021fb673fcff2b8e10c316501c9d09ad8cd1a'
            '74161ac6404007c250caf8ec1556ddb6bbee99b0ac3e18d8616419ca7d7c1d6a')
sha256sums_x86_64=('9a786305eb8f2587a31ad8a1b0ae20bf394877e391255a3472dcfc27559d1a64')
sha256sums_i686=('d12c73e4e537979642b60ead0347948d57785e6c171ab4ab071b7f974ba16dda')
sha256sums_aarch64=('fe6f0b1ae7e6a34e4b89293fcf4463331ef43de5c4113cff44312833a914958a')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
