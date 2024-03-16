# Maintainer: invverse <cheery.art2642 at fastmail dot com>
# Contributer: j.taala <jay at jaytaala dot com>
# Contributer: YagiOoda <yagiooda at pm dot me>
pkgname=everdo
pkgver=1.9.0
pkgrel=3
pkgdesc="Powerful cross-platform GTD app with focus on privacy"
arch=('x86_64')
url='https://everdo.net'
license=('unknown')

depends=(
	'gtk3'
	'nss' 
	'alsa-lib'
	'dbus'
	)

source=("https://release.everdo.net/$pkgver/$pkgname-$pkgver.pacman")

package() {
    # Install the application files in /opt
    install -d "${pkgdir}/opt"
    cp -R "${srcdir}/opt/Everdo" "${pkgdir}/opt/"
    # Install the .desktop file
    install -D -m644 "${srcdir}/usr/share/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    # Install the icons
    for icon_size in 32 64 128 256 512 1024; do
        icons_dir="/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
        install -d "${pkgdir}/${icons_dir}"
        install -m644 "${srcdir}${icons_dir}/${pkgname}.png" \
                      "${pkgdir}${icons_dir}/${pkgname}.png"
    done
}
sha256sums=('f235ee4be60976d2384e88affbeef8f49931066b96641551ad6b2d0d9f155b71')
