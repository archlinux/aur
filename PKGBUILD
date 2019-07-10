# Maintainer: Shane Lyx <shanelyx@outlook.com>
pkgname=another-redis-desktop-manager
pkgver=1.2.4
pkgrel=1
pkgdesc="Another Redis Desktop Manager"
arch=("x86_64")
url="https://github.com/qishibo/AnotherRedisDesktopManager"
license=('MIT')
depends=('aria2' 'libappindicator-sharp' 'libappindicator-gtk3' 'libappindicator-gtk2' 'gconf' 'libindicator-gtk3' 'libindicator-gtk2'
    'libnotify' 'libxss' 'libxtst')

DLAGENTS=('https::/usr/bin/aria2c   -x 5 -c --disable-ipv6=true  --check-certificate=false  -o %o %u')

source=(
    "https://github.com/qishibo/AnotherRedisDesktopManager/releases/download/v1.2.4/Another.Redis.Desktop.Manager.1.2.4.AppImage"
    "another-redis-desktop-manager.desktop"
    "another-redis-desktop-manager.png"
)

md5sums=(
    "9818915d396b59af1037b17fd1c3460f"
    "SKIP"
    "SKIP"
)

package(){
    cd ${srcdir}
    7z x Another.Redis.Desktop.Manager.1.2.4.AppImage -o"${pkgdir}/opt/Another.Redis.Desktop.Manager"
    chmod  -R 755 "${pkgdir}/opt"

    # desktop
    mkdir  -p  ${pkgdir}/usr/share/applications
    install  -Dm644  another-redis-desktop-manager.desktop  ${pkgdir}/usr/share/applications/
    
    # icon
    mkdir  -p  ${pkgdir}/usr/share/icons/hicolor/512x512/apps
    install  -Dm644  another-redis-desktop-manager.png  ${pkgdir}/usr/share/icons/hicolor/512x512/apps/
}



