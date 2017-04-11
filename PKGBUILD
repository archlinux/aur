# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='yandex-disk-indicator'
pkgver=1.9.9
pkgrel=1
pkgdesc='Panel indicator (GUI) for YandexDisk CLI client for Linux.'
arch=('i686' 'x86_64')
url='https://github.com/slytomcat/yandex-disk-indicator'
license=('GPL3')
depends=('yandex-disk' 'python' 'python-pyinotify' 'pygobject-devel' 'python-gobject' 'libappindicator-gtk3' 'xclip' 'zenity')
source=("https://github.com/slytomcat/yandex-disk-indicator/archive/${pkgver}.tar.gz")
sha512sums=('46975b3fb72bdbaec335409ddb389571832919e01491cf167baeb990227f6098a52d85a4a2046a4ef1257f70e85869c569f09590490fdc88aca4c036901d45a6')

package() {
    cd $srcdir
    bsdtar xf ${pkgver}.tar.gz

    cd ${pkgname}-${pkgver}/build
    ./prepare.sh

    mkdir $pkgdir/usr
    cp -r yd-tools/usr/* $pkgdir/usr
}
