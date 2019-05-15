# Maintainer: Manuel Domínguez López <mdomlop at gmail dot com>

_pkgver_year=2019
_pkgver_month=05
_pkgver_day=15

pkgname=snapman
pkgver=1.2a
pkgrel=1
pkgdesc='A backup system based on Btrfs snapshots.'
url="https://github.com/mdomlop/$pkgname"
source=("$pkgname-$pkgver.tar.gz::https://github.com/mdomlop/$pkgname/archive/$pkgver.tar.gz")
license=('GPL3')
arch=('any')
depends=('btrfs-progs' 'python>=3.5' 'python-pyqt5' 'python-setproctitle' 'python-pyqtwebengine' 'khelpcenter')
makedepends=('python-docutils')
changelog=ChangeLog
backup=('etc/snapman.ini')
install="$pkgname.install"

build() {
    cd $srcdir/$pkgname-$pkgver
    make
    }

package() {
    cd $srcdir/$pkgname-$pkgver
    make arch_install DESTDIR="$pkgdir"
}

md5sums=('39111b4720851eaaa77eb5f878bb7f32')
