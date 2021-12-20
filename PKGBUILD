# Maintainer: VHSgunzo <vhsgunzo.github.io>
pkgname=lutris-wine-git
pkgver=0.51.r10.g7251aba
pkgrel=1
pkgdesc='Lutris Wine Runner as system Wine and even better'
arch=('any')
url='https://github.com/VHSgunzo/lutris-wine'
license=('MIT')
depends=('lutris-git' 'wget' 'qt5-tools' 'xterm' 'xorg-fonts-100dpi' 'xorg-fonts-75dpi' 'xorg-fonts-cyrillic' 'xorg-fonts-type1' 'xorg-fonts-misc' 'cabextract' 'perl' 'unzip' 'xorg-xmessage' 'zenity' 'yad' 'xkb-switch' 'imagemagick' 'icoutils' 'lib32-mangohud' 'lib32-vkbasalt' 'mangohud' 'mangohud-common' 'vkbasalt' 'gamemode' 'lib32-gamemode' 'gamescope' 'goverlay' 'giflib' 'lib32-giflib' 'libpng' 'lib32-libpng' 'libldap' 'lib32-libldap' 'gnutls' 'lib32-gnutls' 'mpg123' 'lib32-mpg123' 'openal' 'lib32-openal' 'v4l-utils' 'lib32-v4l-utils' 'libpulse' 'lib32-libpulse' 'libgpg-error' 'lib32-libgpg-error' 'alsa-plugins' 'lib32-alsa-plugins' 'alsa-lib' 'lib32-alsa-lib' 'libjpeg-turbo' 'lib32-libjpeg-turbo' 'sqlite' 'lib32-sqlite' 'libxcomposite' 'lib32-libxcomposite' 'libxinerama' 'lib32-libgcrypt' 'libgcrypt' 'lib32-libxinerama' 'ncurses' 'lib32-ncurses' 'opencl-icd-loader' 'lib32-opencl-icd-loader' 'libxslt' 'lib32-libxslt' 'libva' 'lib32-libva' 'gtk3' 'lib32-gtk3' 'gst-plugins-base-libs' 'lib32-gst-plugins-base-libs' 'lib32-vulkan-icd-loader' 'vulkan-headers' 'vulkan-icd-loader' 'vulkan-tools' 'mesa' 'lib32-glu' 'glu' 'lib32-libva-mesa-driver' 'lib32-mesa' 'libva-mesa-driver' 'mesa-demos' 'mesa-utils' 'mesa-vdpau' 'vulkan-mesa-layers')
makedepends=('git')
optdepends=('lutris-wine-meta' 'lib32-vulkan-radeon' 'vulkan-radeon' 'xf86-video-amdgpu' 'lib32-vulkan-intel' 'vulkan-intel' 'lib32-libva-intel-driver' 'libva-intel-driver' 'libva-utils' 'xf86-video-intel' 'lib32-nvidia-utils' 'lib32-opencl-nvidia' 'libxnvctrl' 'nvidia' 'nvidia-dkms' 'nvidia-settings' 'nvidia-utils' 'opencl-nvidia' 'linux-zen' 'linux-zen-headers')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/VHSgunzo/lutris-wine.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd $srcdir/${pkgname%-git}
    install -Dm755 usr/bin/lutris-wine ${pkgdir}/usr/bin/lutris-wine
    install -Dm644 etc/xdg/menus/applications-merged/LutrisWine.menu ${pkgdir}/etc/xdg/menus/applications-merged/LutrisWine.menu
    install -Dm644 usr/share/applications/LutrisWine/clearpfx.desktop ${pkgdir}/usr/share/applications/LutrisWine/clearpfx.desktop
    install -Dm644 usr/share/applications/LutrisWine/cmd.desktop ${pkgdir}/usr/share/applications/LutrisWine/cmd.desktop
    install -Dm644 usr/share/applications/LutrisWine/control.desktop ${pkgdir}/usr/share/applications/LutrisWine/control.desktop
    install -Dm644 usr/share/applications/LutrisWine/debug.desktop ${pkgdir}/usr/share/applications/LutrisWine/debug.desktop
    install -Dm644 usr/share/applications/LutrisWine/explorer.desktop ${pkgdir}/usr/share/applications/LutrisWine/explorer.desktop
    install -Dm644 usr/share/applications/LutrisWine/killwine.desktop ${pkgdir}/usr/share/applications/LutrisWine/killwine.desktop
    install -Dm644 usr/share/applications/LutrisWine/LutrisWine.desktop ${pkgdir}/usr/share/applications/LutrisWine/LutrisWine.desktop
    install -Dm644 usr/share/applications/LutrisWine/openpfx.desktop ${pkgdir}/usr/share/applications/LutrisWine/openpfx.desktop
    install -Dm644 usr/share/applications/LutrisWine/regedit.desktop ${pkgdir}/usr/share/applications/LutrisWine/regedit.desktop
    install -Dm644 usr/share/applications/LutrisWine/rmapp.desktop ${pkgdir}/usr/share/applications/LutrisWine/rmapp.desktop
    install -Dm644 usr/share/applications/LutrisWine/shell.desktop ${pkgdir}/usr/share/applications/LutrisWine/shell.desktop
    install -Dm644 usr/share/applications/LutrisWine/shortcut.desktop ${pkgdir}/usr/share/applications/LutrisWine/shortcut.desktop
    install -Dm644 usr/share/applications/LutrisWine/addtolu.desktop ${pkgdir}/usr/share/applications/LutrisWine/addtolu.desktop
    install -Dm644 usr/share/applications/LutrisWine/taskmgr.desktop ${pkgdir}/usr/share/applications/LutrisWine/taskmgr.desktop
    install -Dm644 usr/share/applications/LutrisWine/winemgr.desktop ${pkgdir}/usr/share/applications/LutrisWine/winemgr.desktop
    install -Dm644 usr/share/applications/LutrisWine/themesmgr.desktop ${pkgdir}/usr/share/applications/LutrisWine/themesmgr.desktop
    install -Dm644 usr/share/applications/LutrisWine/uninstaller.desktop ${pkgdir}/usr/share/applications/LutrisWine/uninstaller.desktop
    install -Dm644 usr/share/applications/LutrisWine/winecfg.desktop ${pkgdir}/usr/share/applications/LutrisWine/winecfg.desktop
    install -Dm644 usr/share/applications/LutrisWine/winetricks.desktop ${pkgdir}/usr/share/applications/LutrisWine/winetricks.desktop
    install -Dm644 usr/share/applications/LutrisWine/killtray.desktop ${pkgdir}/usr/share/applications/LutrisWine/killtray.desktop
    install -Dm644 usr/share/applications/LutrisWine/update.desktop ${pkgdir}/usr/share/applications/LutrisWine/update.desktop
    install -Dm644 usr/share/applications/LutrisWine/killexe.desktop ${pkgdir}/usr/share/applications/LutrisWine/killexe.desktop
    install -Dm644 usr/share/applications/LutrisWine/tray.desktop ${pkgdir}/usr/share/applications/LutrisWine/tray.desktop
    install -Dm644 usr/share/applications/LutrisWine/exit.desktop ${pkgdir}/usr/share/applications/LutrisWine/exit.desktop
    install -Dm644 usr/share/applications/LutrisWine/killshell.desktop ${pkgdir}/usr/share/applications/LutrisWine/killshell.desktop
    install -Dm644 usr/share/applications/LutrisWine/setwine.desktop ${pkgdir}/usr/share/applications/LutrisWine/setwine.desktop
    install -Dm644 usr/share/desktop-directories/LutrisWineApp.directory ${pkgdir}/usr/share/desktop-directories/LutrisWineApp.directory
    install -Dm644 usr/share/desktop-directories/LutrisWine.directory ${pkgdir}/usr/share/desktop-directories/LutrisWine.directory
    install -Dm644 usr/share/kservices5/ServiceMenus/LutrisWineService.desktop ${pkgdir}/usr/share/kservices5/ServiceMenus/LutrisWineService.desktop
    install -Dm644 usr/share/lutris-wine/icon/default_icon.png ${pkgdir}/usr/share/lutris-wine/icon/default_icon.png
    install -Dm644 "usr/share/lutris-wine/themes/DEFAULT.reg" "${pkgdir}/usr/share/lutris-wine/themes/DEFAULT.reg"
    install -Dm644 "usr/share/lutris-wine/themes/Breeze Dark.reg" "${pkgdir}/usr/share/lutris-wine/themes/Breeze Dark.reg"
    install -Dm644 "usr/share/lutris-wine/themes/Win10 Black.reg" "${pkgdir}/usr/share/lutris-wine/themes/Win10 Black.reg"
    install -Dm644 "usr/share/lutris-wine/themes/Wine Dark.reg" "${pkgdir}/usr/share/lutris-wine/themes/Wine Dark.reg"
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/lutris-wine/LICENSE
}
