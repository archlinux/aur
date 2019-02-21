# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=tuxclocker
pkgver=0.1.1
pkgrel=1
pkgdesc="Qt5 GPU overclocking GUI utility."
arch=('x86_64')
url="https://github.com/Lurkki14/tuxclocker"
license=('GPL3')
makedepends=('qt5-base')
depends=('nvidia-settings' 'nvidia-utils')
conflicts=('tuxclocker-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('7a6a4e669572a318d57b2096544a06b2')

build() {
    cd "$pkgname-$pkgver"
    qmake rojekti.pro
    make
}

package() {
    install -D -m755 "$pkgname-$pkgver/tuxclocker" -t "$pkgdir/usr/bin/"
}
