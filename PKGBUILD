# Maintainer: Alad Wenter <alad@archlinux.org>
# Contributor: Patrick Eigensatz <patrick.eigensatz@gmail.com>
pkgname=qjournalctl
pkgver=0.6
pkgrel=2
pkgdesc="Qt-based graphical user interface for systemd's journalctl command"
arch=('x86_64')
url='https://github.com/pentix/qjournalctl'
license=('GPL')
depends=('glibc' 'gcc-libs' 'qt5-base' 'libssh')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f77bad6ac0c27e30c37554d1fb8e12b8243bf61520c11ca5a84e4fd1218a0f60')

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

