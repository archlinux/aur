# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='yandex-disk-indicator'
pkgver=1.9.11
pkgrel=1
pkgdesc='Panel indicator (GUI) for YandexDisk CLI client for Linux.'
arch=('i686' 'x86_64')
url='https://github.com/slytomcat/yandex-disk-indicator'
license=('GPL3')
depends=('yandex-disk' 'python' 'python-pyinotify' 'pygobject-devel' 'python-gobject' 'libappindicator-gtk3' 'xclip' 'zenity')
source=("https://github.com/slytomcat/yandex-disk-indicator/archive/${pkgver}.tar.gz")
sha512sums=('6b90d03fd93fb5a12f8f6c714032858a97f97e329792f270274114aeb7c0010a74703b0bd32019787437329d1d44662a0e4c95aff0fb6f98be2c454e869b888c')

package() {
    cd $srcdir
    bsdtar xf ${pkgver}.tar.gz

    cd ${pkgname}-${pkgver}/build
    ./prepare.sh

    mkdir $pkgdir/usr
    cp -r yd-tools/usr/* $pkgdir/usr
}
