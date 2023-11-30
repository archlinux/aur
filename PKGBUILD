# Maintainer: honjow <honjow@gmail.com>

pkgname=sk-steam-patch-git
_pkgname=steam-patch
pkgver=0.10.11
pkgrel=1
pkgdesc="Some Steam patches, fixing broken Steam features on Asus Rog Ally"
arch=('x86_64')
url="https://github.com/honjow/steam-patch"
license=('MIT')
_url="${url}/releases/download/v${pkgver}"
source=("steam-patch-pro::${_url}/steam-patch"
        "${_url}/steam-patch.service"
        "${_url}/restart-steam-patch-on-boot.service"
        "${_url}/steamos-priv-write-updated"
        "${_url}/config.toml"
        )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')


package() {
    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/lib/systemd/system"
    install -dm755 "${pkgdir}/usr/bin/steamos-polkit-helpers"
    install -dm755 "${pkgdir}/etc/steam-patch"

    install -Dm755 "${srcdir}/steam-patch-pro" "${pkgdir}/usr/bin/steam-patch-pro"
    install -Dm644 "${srcdir}/steam-patch.service" "${pkgdir}/usr/lib/systemd/system/steam-patch.service"
    install -Dm644 "${srcdir}/restart-steam-patch-on-boot.service" "${pkgdir}/usr/lib/systemd/system/restart-steam-patch-on-boot.service"
    install -Dm755 "${srcdir}/steamos-priv-write-updated" "${pkgdir}/usr/bin/steamos-polkit-helpers/steamos-priv-write"

    install -Dm644 "${srcdir}/config.toml" "${pkgdir}/etc/steam-patch/config.toml"

}