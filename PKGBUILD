# Maintainer: Weitian Leung <weitianleung[at]gmail[dot]com>

pkgname=cu-notify-git
pkgver=r10
pkgrel=1
pkgdesc="Auto check ArchLinux package updates, popup notification if new updates available"
arch=(any)
url="https://github.com/timxx/cu-notify"
license=('MIT')
depends=('python-pyqt5' 'pacman-contrib')
makedepends=('git')
source=("$pkgname::git+https://github.com/timxx/cu-notify.git")
md5sums=('SKIP')
install=${pkgname}.install

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s" "$(git rev-list --count HEAD)"
}

package() {
    cd $srcdir/$pkgname
    install -Dm755 "cu-notify" "$pkgdir/usr/bin/cu-notify"
    install -Dm644 "cu-notify.service" "$pkgdir/usr/lib/systemd/user/cu-notify.service"
}
