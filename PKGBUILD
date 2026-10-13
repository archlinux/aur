pkgname=linux-clang-bin
pkgver=23.1.1
pkgrel=1
pkgdesc="Kernel.org PGO-optimized LLVM/Clang toolchain"
arch=('x86_64')
url="https://www.kernel.org/pub/tools/llvm/"
license=('Apache-2.0 WITH LLVM-exception')
depends=('glibc' 'gcc-libs' 'zlib' 'zstd' 'libxml2')
options=('!strip' '!debug')

_filename="llvm-${pkgver}-x86_64.tar.xz"

source=("https://www.kernel.org/pub/tools/llvm/files/${_filename}")
noextract=("${_filename}")
sha256sums=('4511aee50112bf96d8f5108daa8bc1b99283fab51d37068758f91b9217940129')

package() {
    local dest="${pkgdir}/opt/linux-clang"

    install -dm755 "$dest"

    bsdtar -xf "${srcdir}/${_filename}" \
        -C "$dest" \
        --strip-components=1
}

