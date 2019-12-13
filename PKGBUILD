# Maintainer: Alad Wenter <alad@archlinux.org>
# Contributor: Patrick Eigensatz <patrick.eigensatz@gmail.com>
pkgname=qjournalctl
pkgver=0.6.2
pkgrel=1
pkgdesc="Qt-based graphical user interface for systemd's journalctl command"
arch=('x86_64')
url='https://github.com/pentix/qjournalctl'
license=('GPL')
depends=('glibc' 'gcc-libs' 'qt5-base' 'libssh')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7b402c902ac9fe17bb9696e730a6ff0dcad2b327311951b6be76e89d446f4e72')

build() {
    cd "$pkgname-$pkgver"
    ./autogen.sh
    make
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "$pkgname" -t "$pkgdir/usr/bin/"
    install -Dm644 "ui/$pkgname.png" -t "$pkgdir/usr/share/pixmaps/"
    install -Dm644 "ui/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
}

