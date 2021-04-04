# Maintainer: Dane Johnson <dane@danejohnson.org>

pkgname="couch"
pkgver="0.1.2"
pkgrel="1"
pkgdesc="The Last Bastion of Co-operative Interactive Arts"
arch=("x86_64")
license=("GPL3")
url="https://github.com/dane-johnson/${pkgname}"
depends=("glew" "lua" "glfw" "assimp" "bullet")
makedepends=("cmake")
source=(
        "${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
)

md5sums=(
        "b3b8e3a2d33a245f144a2df720b821df"
)

build() {
        cmake -B build -S "${pkgname}-${pkgver}" \
                -DCMAKE_BUILD_TYPE=Release \
                -DCMAKE_INSTALL_PREFIX='/usr' \
                -Wno-dev
        make -C build
}

package() {
          make DESTDIR="$pkgdir/" -C build install
}