# Maintainer: Oliver Rümpelein <arch@pheerai.de>
pkgname=studiolink-standalone-bin
pkgver=v19.09.0
_pkgver=${pkgver}-beta
pkgrel=1
pkgdesc="A SIP application to create high quality Audio over IP (AoIP) connections."
arch=('x86_64')
url="https://studio-link.de"
license=('custom')
depends=('alsa-lib' 'libpulse' 'hicolor-icon-theme')
opt_depends=('jack: For jack support')
source=("https://download.studio.link/releases/${_pkgver}/studio-link-standalone-linux.zip"
    "LICENSE"
    "studiolink.desktop"
    "studiolink.svg")
sha512sums=('12190ab20e5706f9d816b67737a5f14a2f79f610dbbbb53ffe7304b46c45ed85e4f2e8bd459c0fd949522c59056d8fd22602f78ca69ae8f9355a3b97a0cbbc6d'
            'a3c168d3605190b7de36707a42d1450a22bd0d0b50b52bb4e0a8b169c1035f04f58dca8227d8557f9f0cc574d18323780efa035fd6cd57c3bb35d69a3c517937'
            '2e80376c6ac640da556fa7861d54b44378c18d19a20257e5eef03d72e9c4554d4894c8e6b6168e672bd43e9272071859bcdcf65c75f5006c20c0d689b8080133'
            '3aae487ecddedf17f83f0719c33770f9cb3998681ea3fb39b5c304245c73fdfd7604aee3fff1f54c11ad93256ab778eb3f3467e71c870e8dba8eab43cc2ceef6')

package()
{
    install -Dm755 ${srcdir}/studio-link-standalone ${pkgdir}/usr/bin/studiolink
    install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/studiolink-standalone-bin/LICENSE"

    # freedesktop.org compatibility
    install -Dm644 ${srcdir}/studiolink.desktop ${pkgdir}/usr/share/applications/studiolink.desktop
    install -Dm644 ${srcdir}/studiolink.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/studiolink.svg
}
