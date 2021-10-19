pkgname=xerolinux-rollback-git
pkgver=0.1.34
pkgrel=1
pkgdesc='Xerolinux Rollback Utility to snapshot using the layout proposed in the snapper arch wiki page https://wiki.archlinux.org/index.php/Snapper#Suggested_filesystem_layout'
arch=('any')
license=('GPL3')
url='https://github.com/theduckchannel/xerolinux-rollback-git'
depends=('coreutils' 'python' 'btrfs-progs' 'snapper' 'python-pyqt5' 'python-psutil' 'konsole' 'snapper-rollback' 'ttf-fira-code' 'sudo')
optdepends=()
makedepends=('git')
provides=('xerolinux-rollback')
conflicts=('xerolinux-rollback')
backup=(etc/xerolinux-rollback.conf)
source=(git+"$url.git")
md5sums=('SKIP')

#pkgver() {
#	cd "$pkgname"
#	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

package() {
    cd "$pkgname"
    install -Dm755  "xerolinux-rollback" -t "$pkgdir/usr/bin/"
    install -Dm755  "rollback-frontend" -t "$pkgdir/usr/bin/"
    install -Dm644  "images/xerolinux-logo.png" -t "$pkgdir/usr/share/$pkgname/images"
    install -Dm644  "images/xerolinux-about.png" -t "$pkgdir/usr/share/$pkgname/images"
    install -Dm644  "images/xerolinux-icon.png" -t "$pkgdir/usr/share/icons/hicolor/48x48/apps"
    install -Dm644  "xerolinux-rollback.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
