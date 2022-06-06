# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=tricks-bin
pkgver=0.9.0
pkgrel=2
pkgdesc="The social network for programmers!"
arch=('x86_64')
url="https://tricks.aseman.io/"
license=('GPL3')
conflicts=('tricks')
provides=('tricks')
options=('!emptydirs' '!strip')
source=("https://tricks.aseman.io/tricks/static/downloads/Tricks-${pkgver}_linux.tar.xz"
        "https://raw.githubusercontent.com/Aseman-Land/Tricks/main/LICENSE"
        "tricks.desktop")
sha256sums=('6b984e20c98bc2d6ef76af5b56134d450f806b8004ad27c70d3fcf3e074ba4e2'
						'2ca9503d76d1ffab14f599b4741382eec11face60ad1f0d7a41897809003a286'
            '8cb921da1169ae970e26f46007e2ff4471c3804302bc0089809c09aac35577eb')

prepare() {
    tar xf "Tricks-${pkgver}_linux.tar.xz"
}

package() {
	install -D -m644 tricks.desktop -t "${pkgdir}"/usr/share/applications/
	install -D -m755 tricks-"${pkgver}"_linux/tricks.bin -T "${pkgdir}"/usr/bin/tricks
	install -D -m644 tricks-"${pkgver}"_linux/icon.png -T "${pkgdir}"/usr/share/icons/tricks.png
	install -D -m644 LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
