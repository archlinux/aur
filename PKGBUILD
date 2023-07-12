# Maintainer: Luke Short <ekultails at gmail dot com>

pkgname=vapor-steamos-theme-kde
pkgver=0.16
pkgrel=2
pkgdesc="Vapor theme for KDE Plasma from SteamOS 3"
license=("GPL2")
arch=("any")
source=("https://steamdeck-packages.steamos.cloud/archlinux-mirror/jupiter-rel/os/x86_64/steamdeck-kde-presets-${pkgver}-1-any.pkg.tar.zst")
sha512sums=("780d8796a9f37d7a46fbc92f0e1aaddf05f764c9099cabc5a2c4c134ec1473c856f441e1547437cd2175e2d86e26f09f9922c9477c83ba287f7ded8adc228291")

package() {
    echo "PKG DIR: $pkgdir"
    mkdir -p \
      ${pkgdir}/etc/ \
      ${pkgdir}/usr/share/icons/ \
      ${pkgdir}/usr/share/plasma/ \
      ${pkgdir}/usr/share/plasma/desktoptheme/ \
      ${pkgdir}/usr/share/plasma/look-and-feel/ \
      ${pkgdir}/usr/share/themes/
    mv etc/xdg ${pkgdir}/etc/
    # Prevent Steam from automatically starting by default.
    rm -f ${pkgdir}/etc/xdg/autostart/steam.desktop
    # This file conflicts with the "konsole" package.
    rm -f ${pkgdir}/etc/xdg/konsolerc
    mv usr/share/color-schemes ${pkgdir}/usr/share/
    mv usr/share/icons/hicolor ${pkgdir}/usr/share/icons/
    mv usr/share/plasma/avatars $pkgdir/usr/share/plasma/
    mv usr/share/plasma/desktoptheme/Vapor ${pkgdir}/usr/share/plasma/desktoptheme/
    mv usr/share/plasma/look-and-feel/com.valve.vapor.desktop ${pkgdir}/usr/share/plasma/look-and-feel/
    mv usr/share/themes/Vapor/ ${pkgdir}/usr/share/themes/
    mv usr/share/wallpapers ${pkgdir}/usr/share/
    mv usr/share/konsole ${pkgdir}/usr/share/
}
