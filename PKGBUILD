# Maintainer: Jeremy Huang <jeremyhuang55555@gmail.com>
pkgname=jcode-bin
pkgver=0.33.0
pkgrel=1
pkgdesc="AI coding agent powered by Claude and ChatGPT"
arch=('x86_64')
url="https://github.com/1jehuang/jcode"
license=('MIT')
provides=('jcode')
conflicts=('jcode')
source=("https://github.com/1jehuang/jcode/releases/download/v0.33.0/jcode-linux-x86_64.tar.gz")
sha256sums=('636c7b47959b5c2151a90b9aee9cfbd1d92102b78443342ce55c519d1875be39')

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
