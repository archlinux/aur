# Maintainer: Weitian Leung <weitianleung[at]gmail[dot]com>

pkgname=cu-notify-git
pkgver=r2
pkgrel=1
pkgdesc="Auto check ArchLinux package updates, popup notification if new updates available"
arch=(any)
url="https://github.com/timxx/cu-notify"
license=('MIT')
depends=('libnotify' 'pacman')
makedepends=('git')
source=("$pkgname::git+https://github.com/timxx/cu-notify.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s" "$(git rev-list --count HEAD)"
}

package() {
    cd $srcdir/$pkgname
    install -d "$pkgdir/usr/bin"
    cp cu-notify "$pkgdir/usr/bin"

    install -d "$pkgdir/etc/xdg/autostart"
    cp cu-notify-autostart.desktop "$pkgdir/etc/xdg/autostart"
}
