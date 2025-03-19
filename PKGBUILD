pkgname=plasma6-themes-vapor-steamos
pkgver=0.27
pkgrel=1
pkgdesc="Vapor theme for KDE Plasma from SteamOS 3"
license=("GPL2")
arch=("any")
source=("https://steamdeck-packages.steamos.cloud/archlinux-mirror/jupiter-main/os/x86_64/steamdeck-kde-presets-${pkgver}-1-any.pkg.tar.zst")
sha256sums=('80d2b4f87e227ddc677f6cf224e87af8289c99ec2d496207ec83315c8afc0985')

conflicts=("plasma5-themes-vapor-steamos")
replaces=("plasma5-themes-vapor-steamos")

package() {
    echo "PKG DIR: $pkgdir"
    mkdir -p \
      ${pkgdir}/usr/share/icons/ \
      ${pkgdir}/usr/share/plasma/ \
      ${pkgdir}/usr/share/plasma/desktoptheme/ \
      ${pkgdir}/usr/share/plasma/look-and-feel/ \
      ${pkgdir}/usr/share/themes/
    # Remove unused configurations.
    # /etc/xdg/autostart/steam.desktop = Starts Steam automatically.
    # /etc/xdg/konsolerc = Conflicts with the "konsole" package.
    rm -r -f etc/xdg
    mv usr/share/color-schemes ${pkgdir}/usr/share/
    mv usr/share/icons/hicolor ${pkgdir}/usr/share/icons/
    mv usr/share/plasma/avatars $pkgdir/usr/share/plasma/
    mv usr/share/plasma/desktoptheme/Vapor ${pkgdir}/usr/share/plasma/desktoptheme/
    mv usr/share/plasma/look-and-feel/com.valve.vapor.desktop ${pkgdir}/usr/share/plasma/look-and-feel/
    mv usr/share/themes/Vapor/ ${pkgdir}/usr/share/themes/
    mv usr/share/wallpapers ${pkgdir}/usr/share/
    mv usr/share/konsole ${pkgdir}/usr/share/
}