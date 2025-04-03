# Maintainer: Siavash Askari Nasr <ciavash@protonmail.com>
pkgname=go-chroma-bin
_pkgname=chroma
_binname=chroma
pkgver=2.16.0
pkgrel=1
pkgdesc="A general purpose syntax highlighter in pure Go"
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/alecthomas/chroma'
license=(MIT)
provides=("${_binname}")
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkgname%-bin}-$pkgver-linux-amd64.tar.gz")
source_i686=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkgname%-bin}-$pkgver-linux-386.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkgname%-bin}-$pkgver-linux-arm64.tar.gz")
sha256sums_x86_64=('a02e455807454c562d9a76c45b910b40a18477182d279be18eaf4ad9cf4c303a')
sha256sums_i686=('c931401c67a2b0f1a7f648443e1476b24f5b6a048bc08c1641d546ede424f741')
sha256sums_aarch64=('9e2c199cff45acc4fb1b7ab3df524aaf7b3174daa9ff50c611731e850da3431a')

package() {
    install -Dm755 "${_binname}" -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_binname}"
    install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${_binname}"
}
