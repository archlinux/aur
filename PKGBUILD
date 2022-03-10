# Maintainer: Filipe Nascimento <flipee at tuta dot io>
# Contributor: louis.seubert.ls@gmail.com <Louis Seubert>

pkgname=plasma5-runners-jetbrains-runner
pkgver=1.8.0
pkgrel=1
pkgdesc="A Krunner Plugin which allows you to open your recent projects"
arch=('x86_64')
url="https://github.com/alex1701c/JetBrainsRunner"
license=('LGPL3')
depends=('krunner')
makedepends=('extra-cmake-modules' 'kcmutils')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/JetBrainsRunnerWithSubmodule.tar.gz")
sha256sums=('cca24398537e79ed2f24856221f15e7c1cd5b3c392e23925d697c95abae7f22a')

build() {
    #cd JetBrainsRunnerWithSubmodule
    cmake -B build \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
    make -C build
}

package() {
    #cd JetBrainsRunnerWithSubmodule
    make -C build DESTDIR="$pkgdir" install
}
