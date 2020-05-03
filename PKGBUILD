# Maintainer: Mihir Lad <mihirlad55@gmail.com>
pkgname=polybar-spotify-module
pkgver=1.1.2
pkgrel=1
pkgdesc="Programs to display spotify information and control spotify with polybar"
arch=('any')
url='https://github.com/mihirlad55/polybar-spotify-module'
license=('GPL3')
depends=('dbus' 'spotify' 'polybar')
optdepends=('nerd-fonts-complete: play, pause, etc. icons for spotify module'
            'ttf-font-awesome: more icons for spotify module')

makedepends=('git' 'make')
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
    cd $pkgname/src
    make all
}

package() {
    cd $pkgname/src
    make BASE_INSTALL_PREFIX="$pkgdir/" install
}
