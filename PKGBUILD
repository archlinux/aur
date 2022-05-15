# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=tricks-bin
pkgver=0.1.0
pkgrel=2
pkgdesc="The social network for programmers!"
arch=('x86_64')
url="https://tricks.aseman.io/"
license=('none')
conflicts=('tricks')
provides=('tricks')
options=('!emptydirs' '!strip')
source=("https://tricks.aseman.io/tricks/static/downloads/Tricks-${pkgver}_linux.tar.xz"
        "tricks.desktop")
sha256sums=('e69aa1332f23295d72ed1bd3660d870a6393f672f8fd1858f89259df599bf432'
            '8cb921da1169ae970e26f46007e2ff4471c3804302bc0089809c09aac35577eb')

prepare() {
    tar xf "Tricks-${pkgver}_linux.tar.xz"
}

package() {
    install -D -m644 tricks.desktop -t "${pkgdir}"/usr/share/applications/
    install -D -m755 tricks-"${pkgver}"_linux/tricks.bin -T "${pkgdir}"/usr/bin/tricks
    install -D -m644 tricks-"${pkgver}"_linux/icon.png -T "${pkgdir}"/usr/share/icons/tricks.png
}
