# Maintainer: Oliver Rümpelein <arch@pheerai.de>
pkgname=studiolink-standalone-bin
pkgver=v20.03.7
_pkgver=${pkgver}-stable
pkgrel=1
pkgdesc="A SIP application to create high quality Audio over IP (AoIP) connections."
arch=('x86_64')
url="https://studio-link.de"
license=('custom')
depends=('alsa-lib' 'libpulse' 'hicolor-icon-theme')
source=("https://download.studio.link/releases/${_pkgver}/linux/studio-link-standalone-${pkgver}.tar.gz"
    "LICENSE"
    "studiolink.desktop"
    "studiolink.svg")
sha512sums=('231654200dc71a73444f193bf375867afaa7a201dc094da3f998b2351e07a58a38a2133ce40faf16f16fe781f9a49cbd1593feada19aa8683e5dbc1e2244e56d'
            'a3c168d3605190b7de36707a42d1450a22bd0d0b50b52bb4e0a8b169c1035f04f58dca8227d8557f9f0cc574d18323780efa035fd6cd57c3bb35d69a3c517937'
            '2e80376c6ac640da556fa7861d54b44378c18d19a20257e5eef03d72e9c4554d4894c8e6b6168e672bd43e9272071859bcdcf65c75f5006c20c0d689b8080133'
            '3aae487ecddedf17f83f0719c33770f9cb3998681ea3fb39b5c304245c73fdfd7604aee3fff1f54c11ad93256ab778eb3f3467e71c870e8dba8eab43cc2ceef6')

package()
{
    install -Dm755 ${srcdir}/studio-link-standalone-${pkgver} ${pkgdir}/usr/bin/studiolink
    install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/studiolink-standalone-bin/LICENSE"

    # freedesktop.org compatibility
    install -Dm644 ${srcdir}/studiolink.desktop ${pkgdir}/usr/share/applications/studiolink.desktop
    install -Dm644 ${srcdir}/studiolink.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/studiolink.svg
}
