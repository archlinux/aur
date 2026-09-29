# Maintainer: Jeremy Huang <jeremyhuang55555@gmail.com>
pkgname=jcode-bin
pkgver=0.89.1
pkgrel=1
pkgdesc="AI coding agent powered by Claude and ChatGPT"
arch=('x86_64')
url="https://github.com/1jehuang/jcode"
license=('MIT')
provides=('jcode')
conflicts=('jcode')
source=("https://github.com/1jehuang/jcode/releases/download/v0.89.1/jcode-linux-x86_64.tar.gz")
sha256sums=('a0218a55e0462d399eece05bcabf4b74dcc9c05e6924299f44da55fea70e9974')

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
