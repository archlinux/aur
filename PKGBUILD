# Maintainer: DingZhen <realdingzhen@outlook.com>

pkgname=bfc
pkgver=1.0.1
pkgrel=1
install="${pkgname}.install"
pkgdesc="Fast brainfuck jit interpreter written in cpp"
arch=('x86_64')
url="https://gitlab.com/Kirisashio2/bfcpp"
license=('LGPL')
makedepends=('cmake')
depends=('glibc'
         'gcc-libs'
         'asmjit-git')
source=("$pkgname-$pkgver.tar.gz"::"https://gitlab.com/Kirisashio2/bfcpp/-/archive/1.0.1/bfcpp-1.0.1.tar.gz")

package() {
    cd "${srcdir}/bfcpp-${pkgver}"
    cmake -B build
    cmake --build build --config Release --target bfcpp
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/bfcpp-${pkgver}/build/bfcpp" "${pkgdir}/usr/bin/bfc"
}


sha256sums=('e95cf5a1342d7cb255b7606d57ebf8549f8d8b7384d2cc98badde47e0ad49025')
