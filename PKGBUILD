# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='yandex-disk-indicator'
pkgver=1.9.6
pkgrel=1
pkgdesc='Panel indicator (GUI) for YandexDisk CLI client for Linux.'
arch=('i686' 'x86_64')
url='https://github.com/slytomcat/yandex-disk-indicator'
license=('GPL3')
depends=('yandex-disk' 'python' 'python-pyinotify' 'pygobject-devel' 'python-gobject' 'libappindicator-gtk3' 'xclip' 'zenity')
source=("https://github.com/slytomcat/yandex-disk-indicator/archive/${pkgver}.tar.gz")
sha512sums=('c39d0da1f33c6cb14fdbeb1a1b2ca4b1a0dd7dfb3f2f7a658fd1ec49015da3a0068fc972a38301068344dbe151a67cfc0e9439786ec9b8846d2f4822493acddd')

package() {
    cd $srcdir
    bsdtar xf ${pkgver}.tar.gz

    cd ${pkgname}-${pkgver}/build
    ./prepare.sh

    mkdir $pkgdir/usr
    cp -r yd-tools/usr/* $pkgdir/usr
}
