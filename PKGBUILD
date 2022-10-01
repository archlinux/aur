# Maintainer: Samisafool <thenerdiestguy@gmail.com>
_pkgname=daemon-dotfiles
pkgname=kdeplasma-themes-daemon-git
pkgver=r4.3bd2e02
pkgrel=1
pkgdesc=""
arch=(any)
url="https://github.com/MathisP75/daemon-dotfiles"
license=('GPL')
depends=(kvantum-theme-daemon-git plasma-workspace)
makedepends=(git)
provides=(kdeplasma-themes-daemon)
conflicts=(kdeplasma-themes-daemon)
source=('git+https://github.com/MathisP75/daemon-dotfiles.git')
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_pkgname"
    install -dm755 $pkgdir/usr/share/plasma/look-and-feel
    cp -r 'Global Theme/org.kde.plasma.daemon' $pkgdir/usr/share/plasma/look-and-feel
    install -dm755 $pkgdir/usr/share/plasma/desktoptheme
    cp -r 'Plasma Styles/Daemon' $pkgdir/usr/share/plasma/desktoptheme
    install -dm755 $pkgdir/usr/share/kwin/scripts
    cp -rT 'KWin Scripts/Flex Grid' $pkgdir/usr/share/kwin/scripts/flexgrid
    install -dm755 $pkgdir/usr/share/icons
    cp -r 'Icons/Daemon' $pkgdir/usr/share/icons
    install -dm755 $pkgdir/usr/share/color-schemes
    cp 'Colors/Daemon.colors' $pkgdir/usr/share/color-schemes
}
