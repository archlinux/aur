# Maintainer: Siavash Askari Nasr <ciavash@protonmail.com>
pkgname=go-chroma-bin
_pkgname=chroma
_binname=chroma
pkgver=2.17.0
pkgrel=1
pkgdesc="A general purpose syntax highlighter in pure Go"
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/alecthomas/chroma'
license=(MIT)
provides=("${_binname}")
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkgname%-bin}-$pkgver-linux-amd64.tar.gz")
source_i686=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkgname%-bin}-$pkgver-linux-386.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkgname%-bin}-$pkgver-linux-arm64.tar.gz")
sha256sums_x86_64=('6d570d2576c9bd64b5d807c8f514e732bb7c99ba7f93ea9525581145c7b57fae')
sha256sums_i686=('9e49a4ba2464afff1271e01bc2dba9680858239ea25e91504a7ec3acedec1bb9')
sha256sums_aarch64=('cd23cd6df2c224f7c8fd31c7302aec9fb20521458a3e0e99e59fa2ec64933ad8')

package() {
    install -Dm755 "${_binname}" -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_binname}"
    install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${_binname}"
}
