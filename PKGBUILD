# Maintainer: dhor <dhor@toxic.net.pl>

pkgname=happy-photon-bin
pkgver=0.2.8
pkgrel=1
pkgdesc="Happy Photon is a RAW photos editor, with speed in mind."
arch=('x86_64')
url="https://github.com/seasalim/happy-photon"
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'hicolor-icon-theme')
options=('!strip')
pkgdir=''

source=(
    "https://github.com/seasalim/happy-photon/releases/download/v${pkgver}/happy-photon-${pkgver}-linux-x64.tar.gz"
    "happy-photon.desktop"
    "happy-photon.svg"
)

sha256sums=('872d483aaf3a2aab27ab2cd5160fe57c762745f344c70887cfe60e0893b234fd'
            'd7540b5a7947c7c2deed1112abf28750686a7bc2e5a57f88c4ec22e90be20471'
            '31cf9545f64a8e26b06512ae0d48d23727cdda8532c2bec5351d300fd2ca0423')

package() {
    install -dm755 "$pkgdir/opt/happy-photon"

    install -Dm755 \
        "$srcdir/HappyPhoton" \
        "$pkgdir/opt/happy-photon/HappyPhoton"

    install -Dm644 \
        "$srcdir/happy-photon.desktop" \
        "$pkgdir/usr/share/applications/happy-photon.desktop"

    install -Dm644 \
        "$srcdir/happy-photon.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/happy-photon.svg"
}
