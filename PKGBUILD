# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=purpleclay
_pkgname=gpg-import
pkgname=${_pkgname}-bin
pkgver=0.12.0
pkgrel=1
pkgdesc='Easily import a GPG key within any CI workflow'

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT')

depends=('glibc' 'gcc-libs')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-${arch[0]}-unknown-linux-musl.tar.gz")
source_aarch64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-${arch[1]}-unknown-linux-musl.tar.gz")
sha256sums=('5babf02a83e426450bd589ce25d16ca8387f7bd31077e444a4c6b00748332361'
            '681cfd5d9bf7919d7160a174a0dc95c05defad2e89fe0b6327e84730860868ee')
sha256sums_x86_64=('1449ae3c2218281bf3f59aaa969a1a11dbcd8db3ec37d025cc82ed3525871fc3')
sha256sums_aarch64=('1f6df39c268f8c51a10165f557494b5ff8a541d58f0d7ca7807e249bc77919d9')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
