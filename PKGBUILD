# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=VHSgunzo
_pkgname=sharun
pkgname=${_pkgname}-bin
pkgver=0.7.1
pkgrel=1
pkgdesc='Run dynamically linked ELF binaries everywhere'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
options=('!strip')
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${arch[0]}")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-${arch[1]}")
sha256sums=('ed1795c447be9b4ae96262f583b559f733a82f627b0265f860f22488c7f8b2ff'
            'a2ebbc9295d03cae80fdbda688301adbf2ec763b74bf31ee3224be527e5f2312')
sha256sums_x86_64=('028d7fb36813d76fc5639dc6eeef9d8bf74af0a4533395a8584b2db22c82adb4')
sha256sums_aarch64=('f22b9c53fd8ca41e79c225ea92cef5049f2ae39f2bd27b3d58c98024005d62cc')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
