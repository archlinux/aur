# Maintainer: Filipe Nascimento <flipee at tuta dot io>
# Contributor: louis.seubert.ls@gmail.com <Louis Seubert>

pkgname=plasma5-runners-jetbrains-runner
pkgver=1.7.1
pkgrel=1
pkgdesc="A Krunner Plugin which allows you to open your recent projects"
arch=('x86_64')
url="https://github.com/alex1701c/JetBrainsRunner"
license=('LGPL3')
depends=('krunner')
makedepends=('extra-cmake-modules' 'git' 'kcmutils')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/JetBrainsRunnerWithSubmodule.tar.gz")
sha256sums=('7e9695b817e269f4474f50ce6c878866013c131d1bb9ec23efe1103759df10ad')

build() {
    cd JetBrainsRunnerWithSubmodule
    cmake -B build \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
    make -C build
}

package() {
    cd JetBrainsRunnerWithSubmodule
    make -C build DESTDIR="$pkgdir" install
}
