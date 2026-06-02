# Maintainer: Siavash Askari Nasr <ciavash@protonmail.com>
pkgname=go-chroma-bin
_pkgname=chroma
_binname=chroma
pkgver=2.26.1
pkgrel=1
pkgdesc="A general purpose syntax highlighter in pure Go"
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/alecthomas/chroma'
license=(MIT)
provides=("${_binname}")
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkgname%-bin}-$pkgver-linux-amd64.tar.gz")
source_i686=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkgname%-bin}-$pkgver-linux-386.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkgname%-bin}-$pkgver-linux-arm64.tar.gz")
sha256sums_x86_64=('a993a139c832cc14ad96b259836b43a06564591d2e0b86faf916d387e4610c8b')
sha256sums_i686=('324beab21adac80c9847fb90f9f902c15805b2e7bebc1b2a5f2611c6f1865cd6')
sha256sums_aarch64=('4bd57f45e24d9415f564459d7cacf4ac77b6ec3540ed13958aaf113b869c758b')

package() {
    install -Dm755 "${_binname}" -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_binname}"
    install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${_binname}"
}
