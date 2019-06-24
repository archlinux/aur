# Maintainer: Serge Pavlyuk <flopss at gmail dot com>

pkgname='yandex-disk-indicator-git'
pkgver=1.11.0.r1.g5a59a89
pkgrel=1
pkgdesc='Panel indicator (GUI) for YandexDisk CLI client for Linux.'
arch=('i686' 'x86_64')
url='https://github.com/slytomcat/yandex-disk-indicator'
conflicts=('yandex-disk-indicator')
license=('GPL3')
depends=('yandex-disk' 'python' 'python-pyinotify' 'pygobject-devel' 'python-gobject' 'libappindicator-gtk3' 'xclip' 'zenity')
source=("${pkgname}::git+https://github.com/slytomcat/yandex-disk-indicator.git")
sha512sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    mkdir "$pkgdir/usr"
    cd "$pkgname/build"
    export TARGET=$pkgdir/usr
    ./prepare.sh
}