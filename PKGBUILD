# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Lenovsky <lenovsky at pm dot me>
# Contributor: aimileus <me at aimileus dot nl>

pkgname=protonmail-bridge-bin
pkgver=3.5.3
pkgrel=1
_pkgrel=1
pkgdesc="Integrate ProtonMail paid account with any program that supports IMAP and SMTP"
arch=('x86_64')
url="https://www.protonmail.com/bridge"
license=('GPL3')

depends=('hicolor-icon-theme' 'libsecret' 'ttf-dejavu')
optdepends=(
    'org.freedesktop.secrets: Applications that support Freedesktop secrets api'
    'gnome-keyring: gnome-keyring support'
    'pass: pass support'
)
conflicts=('protonmail-bridge')
options=('!emptydirs' '!strip')
source=("https://protonmail.com/download/bridge/protonmail-bridge_${pkgver}-${_pkgrel}_amd64.deb"
        "https://raw.githubusercontent.com/ProtonMail/proton-bridge/master/LICENSE")
sha256sums=('bb0c263fd316c1276ecfd7905483cfdf782fb35767b610cdd9d56868f938cabd'
            '1b3782ccad7b8614100cda30d3faf42fc39f2e97932908c543005053b654ca68')

prepare() {
    tar xf data.tar.gz
}

package() {
    mv usr/ "${pkgdir}"

    install -D -m644 "${srcdir}"/LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"
}

