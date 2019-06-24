# Maintainer: Sergei Marochkin <me@ziggi.org>
# Maintainer: Ivan Burmin <zirrald@yandex.ru>
# Maintainer: Sergei Snitsky <stalker.medik@gmail.com>

pkgname='yandex-disk-indicator'
pkgver=1.11.0
pkgrel=2
pkgdesc="Panel indicator (GUI) for YandexDisk CLI client for Linux."
arch=('i686' 'x86_64')
url="https://github.com/slytomcat/${pkgname}/"
license=('GPL3')
depends=('yandex-disk' 'python' 'python-pyinotify' 'pygobject-devel' 'python-gobject' 'libappindicator-gtk3' 'xclip' 'zenity')
source=("https://github.com/slytomcat/yandex-disk-indicator/archive/${pkgver}.tar.gz")
sha256sums=('351253b2a06177b235009d2338d43c8f7884032d363ac9d48a496c828fbb58c8')

prepare() {
    cd "${pkgname}-${pkgver}/build"
    chmod +x prepare.sh
}

package() {
    mkdir "${pkgdir}/usr"
    cd "${pkgname}-${pkgver}/build"
    export TARGET="$pkgdir/usr"
    sh prepare.sh
}
