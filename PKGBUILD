pkgname=dobiestation
pkgrel=1
pkgver=72feb6d1009b072ad18387fd3356a9044dc0776b
pkgdesc='A Dog based emulator for the ps2'
arch=(x86_64)
url=https://github.com/PSI-Rockin/DobieStation/
license=('GPL')
groups=()
depends=(qt5-base)
makedepends=(
gcc
cmake
git
)
provides=(dobiestation)
conflicts=(dobiestation)
replaces=(dobiestation)

prepare()
{
    git clone https://github.com/PSI-Rockin/DobieStation.git
    cd DobieStation
    mkdir build && cd build
    cmake .. -DCMAKE_BUILD_TYPE=RelWithDebInfo
}

build() {
    cd DobieStation && cd build
    make 
}

package() {
    cd DobieStation && cd build
    sudo make install
}