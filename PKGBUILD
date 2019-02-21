# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=tuxclocker-git
pkgver=r42.1593f5b
pkgrel=1
pkgdesc="Qt5 GPU overclocking GUI utility. Git version."
arch=('x86_64')
url="https://github.com/Lurkki14/tuxclocker"
license=('GPL3')
makedepends=('git' 'qt5-base')
depends=('nvidia-settings' 'nvidia-utils')
conflicts=('tuxclocker')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/tuxclocker"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/tuxclocker"
    qmake rojekti.pro
    make
}

package() {
    install -D -m755 "$srcdir/tuxclocker/tuxclocker" -t "$pkgdir/usr/bin/"
}
