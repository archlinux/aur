# Maintainer: Serge Pavlyuk <flopss at gmail dot com>

pkgbase='yandex-disk-indicator-git'
pkgname='yandex-disk-indicator-git'
pkgver=1.10.5
pkgrel=1
pkgdesc='Panel indicator (GUI) for YandexDisk CLI client for Linux.'
arch=('i686' 'x86_64')
url='https://github.com/slytomcat/yandex-disk-indicator'
conflicts=('yandex-disk-indicator')
license=('GPL3')
depends=('yandex-disk' 'python' 'python-pyinotify' 'pygobject-devel' 'python-gobject' 'libappindicator-gtk3' 'xclip' 'zenity')
source=("https://github.com/slytomcat/yandex-disk-indicator/archive/${pkgver}.tar.gz")
md5sums=('9886dff3c9407c893d2008debe7a2145')

package() {
    cd $srcdir
    bsdtar xf ${pkgver}.tar.gz

    cd yandex-disk-indicator-${pkgver}/build
    export TARGET="yd-tools/usr"
    ./prepare.sh

    mkdir $pkgdir/usr
    cp -r yd-tools/usr/* $pkgdir/usr
}
