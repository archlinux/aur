# Maintainer: Manuel Domínguez López <mdomlop at gmail dot com>

_pkgver_year=2018
_pkgver_month=09
_pkgver_day=04

pkgname=snapman
pkgver=1.0a
pkgrel=1
pkgdesc='A backup system based on Btrfs snapshots.'
url='https://github.com/mdomlop/snapman'
source=('https://github.com/mdomlop/snapman/archive/1.0a.tar.gz')
md5sums=('f1a861dce3f3fb22fb223fd21c179b4c')
license=('GPL3')
arch=('any')
depends=('btrfs-progs' 'python>=3.5' 'python-pyqt5')
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
