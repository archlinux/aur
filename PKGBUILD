# Maintainer: Filipe Nascimento <flipee at tuta dot io>
# Contributor: louis.seubert.ls@gmail.com <Louis Seubert>

pkgname=plasma5-runners-jetbrains-runner
pkgver=1.9.0
pkgrel=1
pkgdesc="A Krunner Plugin which allows you to open your recent projects"
arch=('x86_64')
url="https://github.com/alex1701c/JetBrainsRunner"
license=('LGPL3')
depends=('krunner')
makedepends=('extra-cmake-modules' 'kcmutils')
install=$pkgname.install
source=("$pkgname-$pkgver.zip::$url/releases/download/$pkgver/JetBrainsRunnerWithSubmodule.zip")
sha256sums=('5f90b716b9ac3799655cd9f3e0b1201f424f869a60ce5bab9cb94125334d8998')

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
