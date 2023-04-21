# Maintainer: DingZhen <realdingzhen@outlook.com>

pkgname=bfc
pkgver=1.0.0
pkgrel=1
install="${pkgname}.install"
pkgdesc="Fast brainfuck jit interpreter written in cpp"
arch=('x86_64')
url="https://gitlab.com/Kirisashio2/bfcpp"
license=('LGPL')
depends=('cmake'
         'glibc'
         'gcc-libs'
         'asmjit-git')
source=("$pkgname-$pkgver.tar.gz"::"https://gitlab.com/Kirisashio2/bfcpp/-/archive/1.0.0/bfcpp-1.0.0.tar.gz")

package() {
    cd "${srcdir}/bfcpp-${pkgver}"
    cmake -B build
    cmake --build build --config Release --target bfcpp
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/bfcpp-${pkgver}/build/bfcpp" "${pkgdir}/usr/bin/bfc"
}


sha256sums=('2b6215ae76a50a0b2cff3fd2e8b2c393660b40acce36a3fd71093f685322b471')
