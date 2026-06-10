# Maintainer: Jeremy Huang <jeremyhuang55555@gmail.com>
pkgname=jcode-bin
pkgver=0.25.1
pkgrel=1
pkgdesc="AI coding agent powered by Claude and ChatGPT"
arch=('x86_64')
url="https://github.com/1jehuang/jcode"
license=('MIT')
provides=('jcode')
conflicts=('jcode')
source=("https://github.com/1jehuang/jcode/releases/download/v0.25.1/jcode-linux-x86_64.tar.gz")
sha256sums=('d5137eb32e711375438f6e5125a5154f1f1d6ce01890bf1a19cf309048509f9f')

package() {
    install -Dm755 "${srcdir}/jcode-linux-x86_64" "${pkgdir}/usr/lib/jcode/jcode-linux-x86_64"
    install -Dm755 "${srcdir}/jcode-linux-x86_64.bin" "${pkgdir}/usr/lib/jcode/jcode-linux-x86_64.bin"
    if compgen -G "${srcdir}/libssl.so*" >/dev/null; then
        install -Dm644 "${srcdir}"/libssl.so* "${pkgdir}/usr/lib/jcode/"
    fi
    if compgen -G "${srcdir}/libcrypto.so*" >/dev/null; then
        install -Dm644 "${srcdir}"/libcrypto.so* "${pkgdir}/usr/lib/jcode/"
    fi
    mkdir -p "${pkgdir}/usr/bin"
    ln -s /usr/lib/jcode/jcode-linux-x86_64 "${pkgdir}/usr/bin/jcode"
}
