# Maintainer: KevinCrrl <kevincrrl@tuta.io>

pkgname=clangd-bin
pkgver=23.1.0
pkgrel=1
pkgdesc='Clangd Language Server; AUR package that provides the power of Clangd without the entire LLVM toolkit'
arch=('x86_64')

url="https://github.com/clangd/clangd"

license=('Apache-2.0 WITH LLVM-exception')

depends=('glibc')

optdepends=('gcc: Compiler without conflicts with clangd')

conflicts=('clang' 'clang18' 'clang19' 'clang20' 'clang21' 'clang22')
provides=('clangd')

options=('!debug')

source=("${url}/releases/download/${pkgver}/clangd-linux-${pkgver}.zip")
sha512sums=('98b7ec7cabae024a939da5c510e26b9abfb235dd0006eca1e2c71acfe4d67c727f86910e916ef7543db2ca48c753a160a756d095bc415594f7fdf7cea249e562')

package() {
    cd "${srcdir}/clangd_${pkgver}"

    install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm755 bin/clangd "$pkgdir/usr/bin/clangd"
}

