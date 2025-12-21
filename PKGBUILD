# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=2.0.2
pkgrel=0
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('cmake' 'qt6-multimedia' 'hicolor-icon-theme' 'yaml-cpp' 'taglib' 'libmpdclient')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/fee72e384e9e6df1a2f3fc8b67aab2268eb6d92e.zip")
sha256sums=('b1eec747eed36a604bf84a42d814117c5b8a640ca91629ba7b3e4dff0237e816')

build() {
    cd mpz-fee72e384e9e6df1a2f3fc8b67aab2268eb6d92e

    rm -rf build
    mkdir build
    cd build
    cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DUSE_SYSTEM_TAGLIB=ON -DUSE_SYSTEM_YAMLCPP=ON ..
    cmake --build .
}

package() {
    cd mpz-fee72e384e9e6df1a2f3fc8b67aab2268eb6d92e

    cd build
    DESTDIR="$pkgdir" cmake --install .
}
