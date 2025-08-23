# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=gophertube
pkgname=${_basename}-bin
pkgver=2.7.0
pkgrel=1
pkgdesc="Minimal terminal YouTube client with mpv, fzf, and chafa previews"
arch=('x86_64')
url="https://github.com/KrishnaSSH/GopherTube"
license=('GPL-3.0-only')
conflicts=("${_basename}")
provides=("${_basename}")
makedepends=('tar')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/${_basename}-${pkgver}-amd64.deb")
sha256sums_x86_64=('58f9a03b37605443dab68ac2ea8a9a0db56c3e78301e94acf30e416db98bba6e')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.gz"

    mv "${pkgdir}/usr/local/bin" "${pkgdir}/usr/"
    rm -rf "${pkgdir}/usr/local/"
} 
