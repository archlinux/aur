# Maintainer: Oliver Rümpelein <arch@pheerai.de>
pkgname=studiolink-standalone-jack-bin
pkgver=v20.03.7
_pkgver=${pkgver}-stable
pkgrel=1
pkgdesc="A SIP application to create high quality Audio over IP (AoIP) connections with experimental jack support."
arch=('x86_64')
url="https://studio-link.de"
license=('custom')
depends=('alsa-lib' 'libpulse' 'hicolor-icon-theme' 'jack')
source=("https://download.studio.link/releases/${_pkgver}/linuxjack/studio-link-standalone-${pkgver}.tar.gz"
    "LICENSE"
    "studiolink.desktop"
    "studiolink.svg")
sha512sums=('07e7f08b57afcabe3492c9116594606b5a2187caa950fa3ee36d1c617699c5699074523f5cab1f9ef1f83935eb15856cf97776358909ab7a796a02223cbd4603'
            'a3c168d3605190b7de36707a42d1450a22bd0d0b50b52bb4e0a8b169c1035f04f58dca8227d8557f9f0cc574d18323780efa035fd6cd57c3bb35d69a3c517937'
            '94df73fd6c7ec37dbc3b8224f8e3e3b30306d0f18ef24606f87f026869b17d7efd8d24a463cd53abf6eded9f95febc43295eaf571cecb5d733a25295e590a6aa'
            '3aae487ecddedf17f83f0719c33770f9cb3998681ea3fb39b5c304245c73fdfd7604aee3fff1f54c11ad93256ab778eb3f3467e71c870e8dba8eab43cc2ceef6')

package()
{
    install -Dm755 ${srcdir}/studio-link-standalone-${pkgver} ${pkgdir}/usr/bin/studiolink-jack
    install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/studiolink-standalone-jack-bin/LICENSE"

    # freedesktop.org compatibility
    install -Dm644 ${srcdir}/studiolink.desktop ${pkgdir}/usr/share/applications/studiolink-jack.desktop
    install -Dm644 ${srcdir}/studiolink.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/studiolink-jack.svg
}
