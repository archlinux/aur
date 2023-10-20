# Maintainer: Filipe Nascimento <flipee at tuta dot io>
# Contributor: louis.seubert.ls@gmail.com <Louis Seubert>

pkgname=plasma5-runners-jetbrains-runner
pkgver=1.9.4
pkgrel=3
pkgdesc="A Krunner Plugin which allows you to open your recent projects"
arch=('x86_64')
url="https://github.com/alex1701c/JetBrainsRunner"
license=('LGPL3')
depends=('krunner5')
makedepends=('extra-cmake-modules' 'kcmutils5')
install=$pkgname.install
source=("$pkgname-$pkgver.zip::$url/releases/download/$pkgver/JetBrainsRunnerWithSubmodule.tar.gz")
sha256sums=('bd228a2a1dd8ca02712189a406f765094e266aad7b382117264425c5e559b212')

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
