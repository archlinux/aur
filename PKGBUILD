# Maintainer: Siavash Askari Nasr <ciavash@protonmail.com>
pkgname=go-chroma-bin
_pkgname=chroma
_binname=chroma
pkgver=2.25.0
pkgrel=1
pkgdesc="A general purpose syntax highlighter in pure Go"
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/alecthomas/chroma'
license=(MIT)
provides=("${_binname}")
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkgname%-bin}-$pkgver-linux-amd64.tar.gz")
source_i686=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkgname%-bin}-$pkgver-linux-386.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkgname%-bin}-$pkgver-linux-arm64.tar.gz")
sha256sums_x86_64=('b040344f3966be115acb3d548c66c4930a362797257099b3a377b5eef7af81f2')
sha256sums_i686=('762a4ace60e6415a36824027999ae4fb686e8068654e1e2534405acc93861ccf')
sha256sums_aarch64=('9acedd11870002119890afa46cc432591e7a3643dcb199c85bcf981fd654c992')

package() {
    install -Dm755 "${_binname}" -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_binname}"
    install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${_binname}"
}
