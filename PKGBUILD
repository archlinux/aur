# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=jooaf
_pkgname=thoth
_pkgexec=thoth
pkgname=${_pkgname}-bin
pkgver=0.1.79
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
sha256sums_x86_64=('e9a7bab35b48544915d6226a36af29d9f5d324977e7f1f83a6d929390ae59002')
sha256sums_aarch64=('c923f24d7d4cb65da4e0250744113c59269dc34520f5bafa353422cc9e736b1e')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgexec}" "${pkgdir}/usr/bin/${_pkgexec}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
