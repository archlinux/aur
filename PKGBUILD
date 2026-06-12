# Source: https://launcher.hytale.com/version/release/launcher.json
# Maintainer: SCDevel <root@scdevel.net>

_version=2026.06.11-00b733c

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
        "LICENSE")

_sha256_linux_amd64='48a2fb2a9a1f7d9a0d6bb2786060fbd7027f53ec93562af3d5956c940101b0d1'

sha256sums=("$_sha256_linux_amd64"
            '0835afe0aec4f086c72518512bf64bfa55679242f3214ca6542fb0fcadd150b9'
            '8a189633047b88b432cd0cf299d1a65cf97e511e4cb4a08951efa93cf4a3e4c9'
            '2ac413e944bff6afba669883dd6686c7f08aa77708b06d8492177fcd48fd6b2c'
            '8aa7dc98faa3a094f5a2ae8c0ad1ff7a65d295b8b3705c5707ec184570d67195'
            '5782bcd7945501383cd6b589797549318cb8e494047c31944fc326ff51ae7047')

package() {
    install -Dm755 "${srcdir}/hytale-launcher" "${pkgdir}/opt/${pkgname}/hytale-launcher"
    install -Dm755 "${srcdir}/hytale-launcher.sh" "${pkgdir}/usr/bin/hytale-launcher"

    install -Dm644 "${srcdir}/com.hypixel.HytaleLauncher.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.hypixel.HytaleLauncher.png"
    install -Dm644 "${srcdir}/com.hypixel.HytaleLauncher.desktop" "${pkgdir}/usr/share/applications/com.hypixel.HytaleLauncher.desktop"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
