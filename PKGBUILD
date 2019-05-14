# Maintainer: Serge Pavlyuk <flopss at gmail dot com>

pkgbase='yandex-disk-indicator-git'
pkgname='yandex-disk-indicator-git'
pkgver=1.10.9
pkgrel=1
pkgdesc='Panel indicator (GUI) for YandexDisk CLI client for Linux.'
arch=('i686' 'x86_64')
url='https://github.com/slytomcat/yandex-disk-indicator'
conflicts=('yandex-disk-indicator')
license=('GPL3')
depends=('yandex-disk' 'python' 'python-pyinotify' 'pygobject-devel' 'python-gobject' 'libappindicator-gtk3' 'xclip' 'zenity')
source=("https://github.com/slytomcat/yandex-disk-indicator/archive/${pkgver}.tar.gz")
sha512sums=('cebaa38087e49b519b4e386a585ab7a81f00071657bbbb052ad5c7324df3e4724335cfaad7291c514701f0059ef9d5504a27efce4860c6f045200f2ac56555b7')

package() {
    cd $srcdir
    bsdtar xf ${pkgver}.tar.gz
    mkdir $pkgdir/usr

    cd yandex-disk-indicator-${pkgver}/build
    export TARGET=$pkgdir/usr
    ./prepare.sh
}
