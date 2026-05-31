# Maintainer: Jeremy Huang <jeremyhuang55555@gmail.com>
pkgname=jcode-bin
pkgver=0.17.2
pkgrel=1
pkgdesc="AI coding agent powered by Claude and ChatGPT"
arch=('x86_64')
url="https://github.com/1jehuang/jcode"
license=('MIT')
provides=('jcode')
conflicts=('jcode')
source=("https://github.com/1jehuang/jcode/releases/download/v0.17.2/jcode-linux-x86_64.tar.gz")
sha256sums=('87480872323284b1b22becaf7733d7a5a818f2dfaddc9a0494a3194c0db27f32')

package() {
    install -Dm755 "${srcdir}/jcode-linux-x86_64" "${pkgdir}/usr/lib/jcode/jcode-linux-x86_64"
    install -Dm755 "${srcdir}/jcode-linux-x86_64.bin" "${pkgdir}/usr/lib/jcode/jcode-linux-x86_64.bin"
    install -Dm644 "${srcdir}"/libssl.so* "${pkgdir}/usr/lib/jcode/"
    install -Dm644 "${srcdir}"/libcrypto.so* "${pkgdir}/usr/lib/jcode/"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s /usr/lib/jcode/jcode-linux-x86_64 "${pkgdir}/usr/bin/jcode"
}
