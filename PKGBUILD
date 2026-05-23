# Maintainer: Jeremy Huang <jeremyhuang55555@gmail.com>
pkgname=jcode-bin
pkgver=0.12.4
pkgrel=1
pkgdesc="AI coding agent powered by Claude and ChatGPT"
arch=('x86_64')
url="https://github.com/1jehuang/jcode"
license=('MIT')
provides=('jcode')
conflicts=('jcode')
source=("https://github.com/1jehuang/jcode/releases/download/v0.12.4/jcode-linux-x86_64.tar.gz")
sha256sums=('8e4cb96c41edf75f8cbd21765a8d48186d4952bcb365f82b52f1569512c3d8dd')

package() {
    install -Dm755 "${srcdir}/jcode-linux-x86_64" "${pkgdir}/usr/lib/jcode/jcode-linux-x86_64"
    install -Dm755 "${srcdir}/jcode-linux-x86_64.bin" "${pkgdir}/usr/lib/jcode/jcode-linux-x86_64.bin"
    install -Dm644 "${srcdir}"/libssl.so* "${pkgdir}/usr/lib/jcode/"
    install -Dm644 "${srcdir}"/libcrypto.so* "${pkgdir}/usr/lib/jcode/"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s /usr/lib/jcode/jcode-linux-x86_64 "${pkgdir}/usr/bin/jcode"
}
