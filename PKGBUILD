# Maintainer: Dane Johnson <dane@danejohnson.org>

pkgname="couch"
pkgver="0.1.3"
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
    "acca12312ea31e2897e59425984639b7"
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
