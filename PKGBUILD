# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=mingw-w64-corrosion
pkgver=0.1.0
pkgrel=1
pkgdesc="Integrate Rust into existing CMake projects (mingw-w64 symlinks)"
arch=('any')
url="https://github.com/corrosion-rs/corrosion"
license=('MIT')
depends=('corrosion')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

package() {
    for _arch in ${_architectures}; do
        install -dm755 "${pkgdir}"/usr/$_arch/lib/cmake
        install -dm755 "${pkgdir}"/usr/$_arch/libexec
        install -dm755 "${pkgdir}"/usr/$_arch/share/cmake
        
        ln -s /usr/lib/cmake/Corrosion "${pkgdir}"/usr/$_arch/lib/cmake/Corrosion
        ln -s /usr/libexec/corrosion-generator "${pkgdir}"/usr/$_arch/libexec/corrosion-generator
        ln -s /usr/share/cmake/Corrosion.cmake "${pkgdir}"/usr/$_arch/share/cmake/Corrosion.cmake
        ln -s /usr/share/cmake/FindRust.cmake "${pkgdir}"/usr/$_arch/share/cmake/FindRust.cmake
    done
}
