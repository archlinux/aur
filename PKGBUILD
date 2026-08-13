# Source: https://launcher.hytale.com/version/release/launcher.json
# Maintainer: SCDevel <root@scdevel.net>

_version=2026.08.11-f021bf9

pkgname=hytale-launcher-bin
pkgver=${_version%-*}
pkgrel=1
pkgdesc="Hytale Launcher (Native Linux, Self-Updating) [${_version}]"
url="https://hytale.com"
license=('LicenseRef-custom')
arch=('x86_64')
options=('!strip' '!debug')
provides=('hytale-launcher')
conflicts=('hytale-launcher')
depends=('webkit2gtk-4.1' 'gtk3' 'hicolor-icon-theme' 'bash' 'xdg-utils' 'libsoup3' 'gdk-pixbuf2' 'glib2' 'glibc')
optdepends=('systemd: Required to check System Time Synchronization.'
            'iproute2: Required to check IPV6 status')
install="hytale-launcher.install"

source=("hytale-launcher-${_version}.zip::https://launcher.hytale.com/builds/release/linux/amd64/hytale-launcher-${_version}.zip"
        "hytale-launcher.install"
        "hytale-launcher.sh"
        "com.hypixel.HytaleLauncher.png"
        "com.hypixel.HytaleLauncher.desktop"
        "com.hypixel.HytaleLauncherAndNodeEditor.desktop"
        "com.hypixel.HytaleNodeEditorOnly.desktop"
        "LICENSE")

_sha256_linux_amd64='a60219d68c393e35ebaa77953946bffa7eb5f681b6138ca7d9055254ed24c00f'

sha256sums=("$_sha256_linux_amd64"
            '0835afe0aec4f086c72518512bf64bfa55679242f3214ca6542fb0fcadd150b9'
            '8ea0be64474661bbb683b9198aac5ab2cc51009ee2ee6f88fe842db625f62ef7'
            '2ac413e944bff6afba669883dd6686c7f08aa77708b06d8492177fcd48fd6b2c'
            '8aa7dc98faa3a094f5a2ae8c0ad1ff7a65d295b8b3705c5707ec184570d67195'
            '91680b75dc640ca84e9b0a6e9d3f482c76b806b55e4895818f569b4c77d10216'
            'a5b4e3bd2977b692129a6b2eb9e0d11d7404fe8a02b41d514b8b8baedbd1c5f0'
            '5782bcd7945501383cd6b589797549318cb8e494047c31944fc326ff51ae7047')

package() {
    install -Dm755 "${srcdir}/hytale-launcher" "${pkgdir}/opt/${pkgname}/hytale-launcher"
    install -Dm755 "${srcdir}/hytale-launcher.sh" "${pkgdir}/usr/bin/hytale-launcher"

    install -Dm644 "${srcdir}/com.hypixel.HytaleLauncher.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.hypixel.HytaleLauncher.png"
    install -Dm644 "${srcdir}/com.hypixel.HytaleLauncher.desktop" "${pkgdir}/usr/share/applications/com.hypixel.HytaleLauncher.desktop"
    install -Dm644 "${srcdir}/com.hypixel.HytaleLauncherAndNodeEditor.desktop" "${pkgdir}/usr/share/applications/com.hypixel.HytaleLauncherAndNodeEditor.desktop"
    install -Dm644 "${srcdir}/com.hypixel.HytaleNodeEditorOnly.desktop" "${pkgdir}/usr/share/applications/com.hypixel.HytaleNodeEditorOnly.desktop"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
