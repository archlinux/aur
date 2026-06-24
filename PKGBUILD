# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=2.0.11
pkgrel=0
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('cmake' 'qt6-multimedia' 'hicolor-icon-theme' 'yaml-cpp' 'taglib' 'libmpdclient')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/9160aec08627b754d12453dc381f856bd4b661fe.zip")
sha256sums=('70068ec659bbc40358e5ca77cb79c046c813258c852b10709a12f731b1b1e14f')

build() {
    cd mpz-9160aec08627b754d12453dc381f856bd4b661fe

    rm -rf build
    mkdir build
    cd build
    cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DUSE_SYSTEM_TAGLIB=ON -DUSE_SYSTEM_YAMLCPP=ON ..
    cmake --build .
}

package() {
    cd mpz-9160aec08627b754d12453dc381f856bd4b661fe

    cd build
    DESTDIR="$pkgdir" cmake --install .
}
