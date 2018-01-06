# Maintainer: Sergei Marochkin <me@ziggi.org>
# Maintainer: Ivan Burmin <zirrald@yandex.ru>

pkgname='yandex-disk-indicator'
pkgver=1.9.14
pkgrel=1
pkgdesc='Panel indicator (GUI) for YandexDisk CLI client for Linux.'
arch=('i686' 'x86_64')
url='https://github.com/slytomcat/yandex-disk-indicator'
license=('GPL3')
depends=('yandex-disk' 'python' 'python-pyinotify' 'pygobject-devel' 'python-gobject' 'libappindicator-gtk3' 'xclip' 'zenity')
source=("https://github.com/slytomcat/yandex-disk-indicator/archive/${pkgver}.tar.gz")
md5sums=('5995fbcb34e648b0a2d76be9e28926c7')

package() {
    cd $srcdir
    bsdtar xf ${pkgver}.tar.gz

    cd ${pkgname}-${pkgver}/build
    ./prepare.sh

    mkdir $pkgdir/usr
    cp -r yd-tools/usr/* $pkgdir/usr
}
