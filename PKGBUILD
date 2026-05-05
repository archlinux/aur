# Maintainer: Jeremy Huang <jeremyhuang55555@gmail.com>
pkgname=jcode-bin
pkgver=0.11.15
pkgrel=1
pkgdesc="AI coding agent powered by Claude and ChatGPT"
arch=('x86_64')
url="https://github.com/1jehuang/jcode"
license=('MIT')
provides=('jcode')
conflicts=('jcode')
source=("https://github.com/1jehuang/jcode/releases/download/v0.11.15/jcode-linux-x86_64.tar.gz")
sha256sums=('c42f2ddda67c0e0d104c051d53b014f7f02fe3828e28e4759918843a35427b4a')

package() {
    install -Dm755 "${srcdir}/jcode-linux-x86_64" "${pkgdir}/usr/lib/jcode/jcode-linux-x86_64"
    install -Dm755 "${srcdir}/jcode-linux-x86_64.bin" "${pkgdir}/usr/lib/jcode/jcode-linux-x86_64.bin"
    install -Dm644 "${srcdir}"/libssl.so* "${pkgdir}/usr/lib/jcode/"
    install -Dm644 "${srcdir}"/libcrypto.so* "${pkgdir}/usr/lib/jcode/"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s /usr/lib/jcode/jcode-linux-x86_64 "${pkgdir}/usr/bin/jcode"
}
