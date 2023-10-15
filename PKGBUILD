# Maintainer: Sergei Marochkin <me@ziggi.org>
# Maintainer: Ivan Burmin <zirrald@yandex.ru>
# Maintainer: Sergei Snitsky <stalker.medik@gmail.com>

pkgname='yandex-disk-indicator'
pkgver=1.12.2
pkgrel=0
pkgdesc="Panel indicator (GUI) for YandexDisk CLI client for Linux."
arch=('i686' 'x86_64')
url="https://github.com/slytomcat/${pkgname}/"
license=('GPL3')
depends=('yandex-disk' 'python' 'python-pyinotify' 'pygobject-devel' 'python-gobject' 'libappindicator-gtk3' 'xclip' 'zenity')
source=("https://github.com/slytomcat/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('77853520338df190fbf1ea8e182896900d78a56528f936851678d4813c2dd1b2')

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
