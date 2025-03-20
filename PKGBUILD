# Maintainer: Sébastien TERRIER <ouinouin at ouinouin dot eu>
pkgname=citron-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="Nintendo Switch emulator forked from yuzu."
arch=(x86_64)
url=https://citron-emu.org
license=(GPL-2.0-or-later)
provides=('citron')
depends=('qt6-base' 'qt6-webengine' 'qt6-multimedia' 'qt6-wayland' 'qt6-tools' 'fmt' 'boost-libs' 'ffmpeg' 'sdl2' 'gamemode' 'hicolor-icon-theme' 'brotli' 'libusb' 'enet' 'opus' 'curl')
conflicts=('citron')
options=(!debug)
DLAGENTS=("https::/usr/bin/wget -O %o %u")
source=(https://git.citron-emu.org/Citron/Citron/releases/download/v${pkgver}-canary-refresh/Citron-Linux-Canary-Refresh_${pkgver}_native.tar.gz
	user-agent
	org.citron_emu.citron.desktop
	citron.svg
	org.citron_emu.citron.xml
	org.citron_emu.citron.metainfo.xml)

sha256sums=('7e06aacfe5be98dfe76dd432ce441e207c6d8d61bd355d0de60d33bb78528280'
            '8f89dffa397f71b4916ee1e134e0e1905979e844a4a697cfd5067bfb6091f49b'
            'aa421c17a9422f61a74c96fe90dbc627281869bc643f0a79edefa8d42bc40dcd'
            '1a1887c8564ce41eb21f4669385def4e3b979d5cfdfafd5e55d97a05cd1ac1d3'
            '26b119de2cbe15df8af065447ba20ea064aa4904bf147e621f3a888b6251d230'
            '24238ccbbdd254fa3aba288e96af92eee12cd5b1eb422a7628f9423a3cee35dc')

package() {
  pushd "Citron-Linux-Canary-Refresh_${pkgver}_native"
    install -Dm755 citron "${pkgdir}/usr/bin/citron"
    install -Dm755 citron-cmd "${pkgdir}/usr/bin/citron-cmd"
    install -Dm755 citron-room "${pkgdir}/usr/bin/citron-room"
    install -Dm755 tzdb2nx "${pkgdir}/usr/bin/tzdb2nx"
  popd

  install -Dm644 "org.citron_emu.citron.desktop" "${pkgdir}/usr/share/applications/org.citron_emu.citron.desktop"
  install -Dm644 "citron.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.citron_emu.citron.svg"
  install -Dm644 "org.citron_emu.citron.xml" "${pkgdir}/usr/share/mime/packages/org.citron_emu.citron.xml"
  install -Dm644 "org.citron_emu.citron.metainfo.xml" "${pkgdir}/usr/share/metainfo/org.citron_emu.citron.metainfo.xml"
}
