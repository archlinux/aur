# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=tricks
pkgver=0.1.0
pkgrel=1
pkgdesc="The social network for programmers!"
arch=('x86_64')
url="https://tricks.aseman.io/"
license=('none')

#depends=('hicolor-icon-theme' 'libsecret' 'ttf-dejavu')
#optdepends=(
#    'org.freedesktop.secrets: Applications that support Freedesktop secrets api'
#    'gnome-keyring: gnome-keyring support'
#    'pass: pass support'
#)
conflicts=('tricks-bin')
options=('!emptydirs' '!strip')
source=("https://tricks.aseman.io/tricks/static/downloads/Tricks-${pkgver}_linux.tar.xz"
        "tricks.desktop")
sha256sums=('971ffd0bcbdbcb2ee014d7c6f27c3eb8f37244bc5c5e69960d16fb9a2acc8607'
            '8cb921da1169ae970e26f46007e2ff4471c3804302bc0089809c09aac35577eb')

prepare() {
    tar xf "Tricks-${pkgver}_linux.tar.xz"
}

package() {
    install -D -m644 tricks.desktop -t "${pkgdir}"/usr/share/applications/
    install -D -m755 tricks-"${pkgver}"_linux/tricks.bin -T "${pkgdir}"/usr/bin/tricks
    install -D -m644 tricks-"${pkgver}"_linux/icon.png -T "${pkgdir}"/usr/share/icons/tricks.png
}
