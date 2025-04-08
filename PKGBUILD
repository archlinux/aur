# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=jooaf
_pkgname=thoth
_pkgexec=thoth
pkgname=${_pkgname}-bin
pkgver=0.1.78
pkgrel=1
pkgdesc='Terminal scratchpad inspired by the Heynote app'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgexec}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux-musl_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux-musl_arm64.tar.gz")
sha256sums=('c6a6aec122be3781408ad1c89b1dc150b5e0d4fa3d56242760d5c47f1fa6c4e6'
            'de0a4239724acfd0c17eb16010a7cd34ae455d0b6391c2deffcde49fd593dd75')
sha256sums_x86_64=('8fd4a45ea1f81920f2dfb9b220e4e0b07f9ab54fc43dd7251248ddedc538d760')
sha256sums_aarch64=('dfec111e5cdbdaf9762b67d5b63821e7ec7876548bde9368e90c8f4529e2bcae')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgexec}" "${pkgdir}/usr/bin/${_pkgexec}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
