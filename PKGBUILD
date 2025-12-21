# Maintainer: KevinCrrl

pkgname=clangd-bin
pkgver=21.1.8
pkgrel=1
pkgdesc='Clangd Language Server'
arch=('x86_64')

# URL del proyecto oficial de clangd
url="https://github.com/clangd/clangd"

# Licencia de clangd
license=('Apache-2.0 WITH LLVM-exception')

depends=('glibc' )

optdepends=('gcc: Compiler without conflicts with clangd')

conflicts=('clangd' 'clang' 'clang18' 'clang19')
provides=('clangd')

options=('!debug')

source=("${url}/releases/download/${pkgver}/clangd-linux-${pkgver}.zip")
sha256sums=('e0b214a59906dfceef33406873c4379fb8e768fb4345d8afa7f307bd2ec899de')

package() {
    cd "${srcdir}/clangd_${pkgver}" || exit 1

    install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm755 bin/clangd "$pkgdir/usr/bin/clangd"
}
