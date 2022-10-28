# Maintainer: Lukas Nabakowski <lnabakowski at mailo dot com>
pkgname=bisc-bin
pkgver=0.4.1
pkgrel=1
epoch=0
pkgdesc="A small tool that clears cookies for qutebrowser and chromium-based browsers"
arch=('x86_64')
url="https://maxwell.ydns.eu/git/rnhmjoj/bisc"
license=('GPL3')
source=("https://maxwell.ydns.eu/git/attachments/f0b23dae-4a24-47dd-858f-12b57fe7029e")
md5sums=('aca537fb2ebc8e2c0bcb6bcdfab150e4')

prepare() {
    # make the source files writable, so that they can be deleted later, because upstream gives them no write file permissions
    chmod -R +w "${srcdir}/result"
}

package() {
    install -Dm 755 "${srcdir}/result/bin/bisc" "${pkgdir}/usr/bin/bisc"
    install -Dm 644 "${srcdir}/result/share/bash-completion/completions/bisc.bash" "${pkgdir}/usr/share/bash-completion/completions/bisc.bash"
    install -Dm 644 "${srcdir}/result/share/fish/vendor_completions.d/bisc.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/bisc.fish"
    install -Dm 644 "${srcdir}/result/share/man/man5/bisc.conf.5.gz" "${pkgdir}/usr/share/man/man5/bisc.conf.5.gz"
    install -Dm 644 "${srcdir}/result/share/man/man1/bisc.1.gz" "${pkgdir}/usr/share/man/man1/bisc.1.gz"
    install -Dm 644 "${srcdir}/result/share/zsh/site-functions/_bisc" "${pkgdir}/usr/share/zsh/site-functions/_bisc"
}
