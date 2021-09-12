pkgname=simple-powermenu-git
pkgver=0.1.2
pkgrel=1
pkgdesc='A very simple powermenu for bspwm users.'
arch=('any')
license=('GPL3')
url='https://github.com/theduckchannel/simple-powermenu-git'
depends=('coreutils' 'python' 'python-qdarkstyle' 'python-pyqt5' 'python-pynput' 'i3lock-color')
optdepends=()
makedepends=('git')
provides=('simple-powermenu')
conflicts=('simple-powermenu')
source=(git+"$url.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    # Binaries
    install -Dm755  "simple-powermenu" -t "$pkgdir/usr/bin/"
    install -Dm755  "simple-screenlock" -t "$pkgdir/usr/bin/"
    # Images
    install -Dm644  "images/lock.png" -t "$pkgdir/usr/share/$pkgname/images"
    install -Dm644  "images/reboot.png" -t "$pkgdir/usr/share/$pkgname/images"
    install -Dm644  "images/shutdown.png" -t "$pkgdir/usr/share/$pkgname/images"
    # Install App Icon
    install -Dm644  "images/simple-powermenu-icon.png" -t "$pkgdir/usr/share/icons/hicolor/48x48/apps"
    # Install desktop file
    install -Dm644  "simple-powermenu.desktop" -t "$pkgdir/usr/share/applications/"
    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
