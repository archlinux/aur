# Maintainer: KevinCrrl

pkgname=clangd-bin
pkgver=22.1.6
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
sha512sums=('7eb5463b29203735213d02e75e79a4802030f766c7ce087409f4a1c42f4995f564574303c1814266213fbd078832da44763172f8ba96b2cdfabf102a2dc89b03')

package() {
    cd "${srcdir}/clangd_${pkgver}"

    install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm755 bin/clangd "$pkgdir/usr/bin/clangd"
}
