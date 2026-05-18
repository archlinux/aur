# Maintainer: Federico Bologni <bologni.federico@inwd.org>

pkgname=nitrokey-app2-bin
_pkgname=nitrokey-app2
pkgver=2.7.1
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
            '501a2cdee6323fc0a79f3744ea6a15af07f008a0b301eba70eb4594860173a70')
sha256sums_x86_64=('ae7dab9b59d92b940b65903e8245590c5b26c681ec4294c5f2d4ede9207ca92d')
sha256sums_aarch64=('8c3f1f13dd2800ab34c1fabcbf16731503432e0bc3e53483421bba2b8be75472')

package() {
    install -Dm755 "nitrokeyapp-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/nitrokeyapp"
    install -Dm644 "com.nitrokey.nitrokey-app2.desktop"      "${pkgdir}/usr/share/applications/com.nitrokey.nitrokey-app2.desktop"
    install -Dm644 "com.nitrokey.nitrokey-app2.svg"          "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.nitrokey.nitrokey-app2.svg"
    install -Dm644 "com.nitrokey.nitrokey-app2.metainfo.xml" "${pkgdir}/usr/share/metainfo/com.nitrokey.nitrokey-app2.metainfo.xml"
}
