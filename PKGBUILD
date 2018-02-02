# Maintainer: Sergei Marochkin <me@ziggi.org>
# Maintainer: Ivan Burmin <zirrald@yandex.ru>

pkgname='yandex-disk-indicator'
pkgver=1.9.18
pkgrel=2
pkgdesc='Panel indicator (GUI) for YandexDisk CLI client for Linux.'
arch=('i686' 'x86_64')
url='https://github.com/slytomcat/yandex-disk-indicator'
license=('GPL3')
depends=('yandex-disk' 'python' 'python-pyinotify' 'pygobject-devel' 'python-gobject' 'libappindicator-gtk3' 'xclip' 'zenity')
source=("https://github.com/slytomcat/yandex-disk-indicator/archive/${pkgver}.tar.gz")
md5sums=('2bbaac0bcabe1f5f6a8d89bac0bf7fba')

package() {
    cd $srcdir
    bsdtar xf ${pkgver}.tar.gz

    cd ${pkgname}-${pkgver}/build
    ./prepare.sh

    mkdir $pkgdir/usr
    cp -r yd-tools/usr/* $pkgdir/usr
}
