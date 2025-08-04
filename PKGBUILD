# Maintainer: Siavash Askari Nasr <ciavash@protonmail.com>
pkgname=go-chroma-bin
_pkgname=chroma
_binname=chroma
pkgver=2.20.0
pkgrel=1
pkgdesc="A general purpose syntax highlighter in pure Go"
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/alecthomas/chroma'
license=(MIT)
provides=("${_binname}")
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkgname%-bin}-$pkgver-linux-amd64.tar.gz")
source_i686=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkgname%-bin}-$pkgver-linux-386.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkgname%-bin}-$pkgver-linux-arm64.tar.gz")
sha256sums_x86_64=('dc7eae4ec392da599c90c1f5bf628f9510cdbc7950a2795a2519d777a375f6e4')
sha256sums_i686=('7012a07dea038cd8331cd1d5a293f718e1cc8af7eecc9b7b783d0d41709ff566')
sha256sums_aarch64=('9c1b65cdaa1d80d25db0884f0976e9130a21d3dc2e3e33452c3302b7ed3a7531')

package() {
    install -Dm755 "${_binname}" -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_binname}"
    install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${_binname}"
}
