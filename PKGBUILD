# Maintainer: <andrew dot myers at fdservices  dot co dot uk>
pkgname=vpacman
pkgver=1.0.2
pkgrel=1
pkgdesc="A programme to view and manage the pacman database - built with Tcl/Tk"
arch=('any')
url="http://sourceforge.net/projects/vpacman"
license=('GPL')
depends=('tcl' 'tk' 'wmctrl')
optdepends=('xorg-xwininfo: for fine control of terminal windows'
			'pkgfile: for faster retrieval of package files'
			)
source=(http://sourceforge.net/projects/vpacman/files/vpacman-$pkgver.tar.gz)
md5sums=('f7d5946d611b1fb94fdaa4ec4571d735')

package() {
    cd "$srcdir/$pkgname-$pkgver"
#   /opt/local/vpacman
    install -d "$pkgdir"/opt/local/vpacman
    install -m755 vpacman.tcl "$pkgdir"/opt/local/vpacman
    install -m644 README.txt "$pkgdir"/opt/local/vpacman
#   /opt/local/vpacman/icons
    install -d "$pkgdir"/opt/local/vpacman/icons
    install -d "$pkgdir"/opt/local/vpacman/icons/medium
    install -d "$pkgdir"/opt/local/vpacman/icons/small
    install -d "$pkgdir"/opt/local/vpacman/icons/tiny
    install -m644 icons/medium/* "$pkgdir"/opt/local/vpacman/icons/medium
    install -m644 icons/small/* "$pkgdir"/opt/local/vpacman/icons/small
    install -m644 icons/tiny/* "$pkgdir"/opt/local/vpacman/icons/tiny
#   /usr/bin
    install -d "$pkgdir"/usr/bin
    install -m755 vpacman "$pkgdir"/usr/bin/
#   /usr/share/applications
    install -d "$pkgdir"/usr/share/applications
    install -m644 vpacman.desktop "$pkgdir"/usr/share/applications/
}






