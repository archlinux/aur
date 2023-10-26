# Maintainer: Samisafool <thenerdiestguy@gmail.com>
_pkgname=daemon-dotfiles
pkgname=plasma5-themes-daemon-git
pkgver=r25.a30023e
pkgrel=1
pkgdesc="Cyberpunk style theme for KDE"
arch=(any)
url="https://github.com/MathisP75/daemon-dotfiles"
license=('GPL')
depends=(kvantum-theme-daemon-git plasma-workspace kwin-effects-burn-my-windows-git bibata-cursor-theme)
makedepends=(git)
provides=(kdeplasma-themes-daemon kdeplasma-themes-daemon-git)
conflicts=(kdeplasma-themes-daemon kdeplasma-themes-daemon-git)
options=(!strip)
source=('git+https://github.com/MathisP75/daemon-dotfiles.git')
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_pkgname"
    install -dm755 $pkgdir/usr/share/plasma/desktoptheme
    cp -r 'plasma-styles/Daemon' $pkgdir/usr/share/plasma/desktoptheme
    install -dm755 $pkgdir/usr/share/color-schemes
    cp 'colors/Daemon.colors' $pkgdir/usr/share/color-schemes
    install -dm755 $pkgdir/usr/share/aurorae/themes
    cp -r 'window-borders/Daemon' $pkgdir/usr/share/aurorae/themes
    install -dm755 $pkgdir/usr/share/icons
    cp -r 'icons/Daemon' $pkgdir/usr/share/icons
    install -dm755 $pkgdir/usr/share/plasma/look-and-feel
    cp -r 'global-theme/org.kde.plasma.daemon' $pkgdir/usr/share/plasma/look-and-feel
    install -dm755 $pkgdir/usr/share/kwin/scripts/flexgrid
    cp -rT 'kwin-scripts/flex-grid' $pkgdir/usr/share/kwin/scripts/flexgrid
    cp -r 'splash-screen/Daemon' $pkgdir/usr/share/plasma/look-and-feel
}
