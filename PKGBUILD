# SPDX-FileCopyrightText: 2026 Open Health Technology Foundation contributors
# SPDX-License-Identifier: AGPL-3.0-or-later WITH LicenseRef-PanicButton-app-store-exception
#
# Template for the AUR package panic-button-bin, filled in by release.yml
# (0.2.1, 4309b7ed0d6a0038cf47b002a52772cc8d4ec79b143d1465a62024332e662d11, 7de16be1774008ece12e623cd2f2711bfb11063db7b7d875cd15ffc375b7e0f3).
pkgname=panic-button-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Staff panic alarm: call colleagues for help from this computer (desktop app)"
arch=('x86_64')
url="https://github.com/ohtf/panic-button"
license=('AGPL-3.0-or-later' 'LicenseRef-PanicButton-app-store-exception')
depends=('webkit2gtk-4.1' 'gtk3' 'alsa-lib' 'libayatana-appindicator' 'hicolor-icon-theme')
provides=('panic-button')
conflicts=('panic-button')
source=("panic-button-desktop_${pkgver}_amd64.deb::https://github.com/ohtf/panic-button/releases/download/v${pkgver}/panic-button-desktop_${pkgver}_amd64.deb"
        "LICENSE-EXCEPTIONS-${pkgver}.md::https://raw.githubusercontent.com/ohtf/panic-button/v${pkgver}/LICENSE-EXCEPTIONS.md")
noextract=("panic-button-desktop_${pkgver}_amd64.deb")
sha256sums=('4309b7ed0d6a0038cf47b002a52772cc8d4ec79b143d1465a62024332e662d11'
            '7de16be1774008ece12e623cd2f2711bfb11063db7b7d875cd15ffc375b7e0f3')

package() {
  bsdtar -xOf "panic-button-desktop_${pkgver}_amd64.deb" data.tar.gz | bsdtar -xf - -C "${pkgdir}"
  install -Dm644 "LICENSE-EXCEPTIONS-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-EXCEPTIONS.md"
}
