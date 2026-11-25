# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=bbs-go-bin
pkgver=4.4.8
pkgrel=1
pkgdesc="A lightweight community and Q&A platform for forums, knowledge bases, and discussions"
arch=('x86_64' 'aarch64')
url="https://github.com/mlogclub/bbs-go"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/mlogclub/bbs-go/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/bbs-go-linux-amd64-g8ce7bac2.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/bbs-go-linux-arm64-g8ce7bac2.tar.gz")
sha256sums=('230184f60bae2feaf244f10a8bac053c8ff33a183bcc365b4d8b876d2b7f4809')
sha256sums_x86_64=('7f1e033d2f4f09e749e4224eab32edcf36c1155aaaa6a76157604071d55ac625')
sha256sums_aarch64=('4133a1f8ea6591b5e33270c7c128b3f4d3b84308e5941b4740a0796a1865b883')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="bbs-go-linux-amd64-g8ce7bac2" ;;
    aarch64) _dir="bbs-go-linux-arm64-g8ce7bac2" ;;
  esac
  install -Dm755 "${_dir}/bbs-go" "${pkgdir}/usr/bin/bbs-go"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
