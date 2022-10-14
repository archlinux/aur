# Maintainer: Samisafool <thenerdiestguy@gmail.com>
_pkgname=daemon-dotfiles
pkgname=kdeplasma-themes-daemon-git
pkgver=r4.3bd2e02
pkgrel=5
pkgdesc="Cyberpunk style theme for KDE"
arch=(any)
url="https://github.com/MathisP75/daemon-dotfiles"
license=('GPL')
depends=(kvantum-theme-daemon-git plasma-workspace)
makedepends=(git)
provides=(kdeplasma-themes-daemon)
conflicts=(kdeplasma-themes-daemon)
options=(!strip)
source=('git+https://github.com/MathisP75/daemon-dotfiles.git')
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_pkgname"
    install -dm755 $pkgdir/usr/share/color-schemes
    cp 'colors/Daemon.colors' $pkgdir/usr/share/color-schemes
    install -dm755 $pkgdir/usr/share/plasma/look-and-feel
    cp -r 'global-theme/org.kde.plasma.daemon' $pkgdir/usr/share/plasma/look-and-feel
    cp -r 'splash-screen/Daemon' $pkgdir/usr/share/plasma/look-and-feel
    install -dm755 $pkgdir/usr/share/plasma/desktoptheme
    cp -r 'plasma-styles/Daemon' $pkgdir/usr/share/plasma/desktoptheme
    install -dm755 $pkgdir/usr/share/icons
    cp -r 'icons/Daemon' $pkgdir/usr/share/icons
    install -dm755 $pkgdir/usr/share/aurorae/themes
    cp -r 'window-borders/Daemon' $pkgdir/usr/share/aurorae/themes
    install -dm755 $pkgdir/usr/share/kwin/scripts
    cp -rT 'kwin-scripts/flex-grid' $pkgdir/usr/share/kwin/scripts/flexgrid
}
