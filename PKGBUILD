# Maintainer: Filipe Nascimento <flipee at tuta dot io>
# Contributor: louis.seubert.ls@gmail.com <Louis Seubert>

pkgname=plasma5-runners-jetbrains-runner
pkgver=1.9.3
pkgrel=1
pkgdesc="A Krunner Plugin which allows you to open your recent projects"
arch=('x86_64')
url="https://github.com/alex1701c/JetBrainsRunner"
license=('LGPL3')
depends=('krunner')
makedepends=('extra-cmake-modules' 'kcmutils')
install=$pkgname.install
source=("$pkgname-$pkgver.zip::$url/releases/download/$pkgver/JetBrainsRunnerWithSubmodule.tar.gz")
sha256sums=('384d599744ff78198a2d179a47d32fe5744b87a8c37298c62e4b1d98805f0aea')

build() {
    cd JetBrainsRunner
    cmake -B build \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
    make -C build
}

package() {
    cd JetBrainsRunner
    make -C build DESTDIR="$pkgdir" install
}
