# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=jooaf
_pkgname=thoth
_pkgexec=thoth
pkgname=${_pkgname}-bin
pkgver=0.1.84
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
            '7b2518c05beed662f00018d6244626333638953421829a4a4dd06dbdd46c4018')
sha256sums_x86_64=('01f56dabddb5fab7f15dbad50417226e9cd6b54069aa7b6366b84ac8e9f997e4')
sha256sums_aarch64=('07b557aa2d694c3d9854c825084c48dad1187581f8030cbab9056041fe042c3c')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgexec}" "${pkgdir}/usr/bin/${_pkgexec}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
