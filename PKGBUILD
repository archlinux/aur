# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=tricks
pkgver=0.1.3
pkgrel=1
pkgdesc="The social network for programmers!"
arch=('x86_64')
url="https://tricks.aseman.io/"
license=('none')

conflicts=('tricks-bin')
options=('!emptydirs' '!strip')
source=("https://tricks.aseman.io/tricks/static/downloads/Tricks-${pkgver}_linux.tar.xz"
        "tricks.desktop")
sha256sums=('b9a5f92cc6671a29c84321b49f800928fc858bf81f53fe0e4d742d233159b400'
            '8cb921da1169ae970e26f46007e2ff4471c3804302bc0089809c09aac35577eb')

prepare() {
    tar xf "Tricks-${pkgver}_linux.tar.xz"
}

package() {
    install -D -m644 tricks.desktop -t "${pkgdir}"/usr/share/applications/
    install -D -m755 tricks-"${pkgver}"_linux/tricks.bin -T "${pkgdir}"/usr/bin/tricks
    install -D -m644 tricks-"${pkgver}"_linux/icon.png -T "${pkgdir}"/usr/share/icons/tricks.png
}
