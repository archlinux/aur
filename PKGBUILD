# Maintainer: KevinCrrl

pkgname=clangd-bin
pkgver=22.1.0
pkgrel=1
pkgdesc='Clangd Language Server'
arch=('x86_64')

url="https://github.com/clangd/clangd"

license=('Apache-2.0 WITH LLVM-exception')

depends=('glibc')

optdepends=('gcc: Compiler without conflicts with clangd')

conflicts=('clangd' 'clang' 'clang18' 'clang20' 'clang21')
provides=('clangd')

options=('!debug')

source=("${url}/releases/download/${pkgver}/clangd-linux-${pkgver}.zip")
sha512sums=('2b851325118f3be4053afd5e53bb53211566b67391f03173e7800782ffc2aefa0760d45a666be39d6f4e7527361b80d3d4203ffa95684a47d8f16b7d8def6d72')

package() {
    cd "${srcdir}/clangd_${pkgver}"

    install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm755 bin/clangd "$pkgdir/usr/bin/clangd"
}
