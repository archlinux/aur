# Maintainer: KevinCrrl

pkgname=clangd-bin
pkgver=21.1.0
pkgrel=3
pkgdesc='Clangd Language Server'
arch=('x86_64')

# URL del proyecto oficial de clangd
url="https://github.com/clangd/clangd"

# Licencia de clangd
license=('Apache-2.0 WITH LLVM-exception')

depends=()

optdepends=('gcc: Compiler without conflicts with clangd')

conflicts=('clangd' 'clang' 'clang18' 'clang19')
provides=('clangd')

options=('!debug')

source=("${url}/releases/download/${pkgver}/clangd-linux-${pkgver}.zip")
sha256sums=('d9a2e8dd5dfbb68d892c2b51f3a735b526148fef89141ffea6ee7ff8637fd1a6')

package() {
    cd "${srcdir}/clangd_${pkgver}" || exit 1

    install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm755 bin/clangd "$pkgdir/usr/bin/clangd"
}
