# Maintainer: Shane Lyx <shanelyx at outlook dot com>
pkgname=another-redis-desktop-manager
pkgver=1.2.4
pkgrel=1
pkgdesc="Another Redis Desktop Manager"
arch=("x86_64")
url="https://github.com/qishibo/AnotherRedisDesktopManager"
license=('MIT')
depends=('libappindicator-sharp' 'libappindicator-gtk3' 'libappindicator-gtk2' 'gconf' 'libindicator-gtk3' 'libindicator-gtk2'
    'libnotify' 'libxss' 'libxtst')

source=(
    "https://github.com/qishibo/AnotherRedisDesktopManager/releases/download/v1.2.4/Another.Redis.Desktop.Manager.1.2.4.AppImage"
    "another-redis-desktop-manager.desktop"
    "another-redis-desktop-manager.png"
	"LICENSE"
)

md5sums=('9818915d396b59af1037b17fd1c3460f'
         '11ac6e7e9d578a9ad0b548c3fc9a2527'
         '3f7c15e66be6ffd8b70fbb50882fc0dd'
         '74fd786ee05276f7550f94e8ed1bf495')

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
	
	#license
	mkdir -p "${pkgdir}"/usr/share/licenses/${pkgname}
	install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}



