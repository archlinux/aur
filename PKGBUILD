# Maintainer: Federico Bologni <bologni.federico@inwd.org>

pkgname=nitrokey-app2-bin
_pkgname=nitrokey-app2
pkgver=2.7.0
pkgrel=1
pkgdesc='Nitrokey management application for Nitrokey 3 devices (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/Nitrokey/nitrokey-app2'
license=('Apache-2.0')
depends=('pcsclite' 'hicolor-icon-theme')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
source=("com.nitrokey.nitrokey-app2.desktop::${url}/raw/v${pkgver}/meta/com.nitrokey.nitrokey-app2.desktop"
        "com.nitrokey.nitrokey-app2.svg::${url}/raw/v${pkgver}/meta/nk-app2.svg"
        "com.nitrokey.nitrokey-app2.metainfo.xml::${url}/raw/v${pkgver}/meta/com.nitrokey.nitrokey-app2.metainfo.xml")
source_x86_64=("nitrokeyapp-${pkgver}-${CARCH}::${url}/releases/download/v${pkgver}/nitrokey-app-v${pkgver}-x64-linux-binary")
source_aarch64=("nitrokeyapp-${pkgver}-${CARCH}::${url}/releases/download/v${pkgver}/nitrokey-app-v${pkgver}-arm64-linux-binary")
sha256sums=('998e95da01257458b52236746d18036254fd292b63d6d5f4b839d1b82fe94a4e'
            'e49609f53b375f9eb69d7024699e403ad6913f40453bfe2bdf1bab362e78206e'
            'ad66ee8cd11f0336a8b3621583aa0d382305609dbafb4e415c581e6ea6bfb9ef')
sha256sums_x86_64=('7c662b313c42789d5bfbcfaa6f74eca315e6eb2c83f19ef3858532a456418b9d')
sha256sums_aarch64=('3c350255b4e618388795ff911a2bf75050de98e273555a880f7c59501d8b26cf')

package() {
    install -Dm755 "nitrokeyapp-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/nitrokeyapp"
    install -Dm644 "com.nitrokey.nitrokey-app2.desktop"      "${pkgdir}/usr/share/applications/com.nitrokey.nitrokey-app2.desktop"
    install -Dm644 "com.nitrokey.nitrokey-app2.svg"          "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.nitrokey.nitrokey-app2.svg"
    install -Dm644 "com.nitrokey.nitrokey-app2.metainfo.xml" "${pkgdir}/usr/share/metainfo/com.nitrokey.nitrokey-app2.metainfo.xml"
}
