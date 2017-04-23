# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='yandex-disk-indicator'
pkgver=1.9.10
pkgrel=1
pkgdesc='Panel indicator (GUI) for YandexDisk CLI client for Linux.'
arch=('i686' 'x86_64')
url='https://github.com/slytomcat/yandex-disk-indicator'
license=('GPL3')
depends=('yandex-disk' 'python' 'python-pyinotify' 'pygobject-devel' 'python-gobject' 'libappindicator-gtk3' 'xclip' 'zenity')
source=("https://github.com/slytomcat/yandex-disk-indicator/archive/${pkgver}.tar.gz")
sha512sums=('122bbb789601e673c2c816d04a70fb04c9a0c520cac1754271c6a291124ebc3581d2a55c60f55e3186597c96f5ea209b3f15b6fe3b0790c4251d0ec85b843cd7')

package() {
    cd $srcdir
    bsdtar xf ${pkgver}.tar.gz

    cd ${pkgname}-${pkgver}/build
    ./prepare.sh

    mkdir $pkgdir/usr
    cp -r yd-tools/usr/* $pkgdir/usr
}
