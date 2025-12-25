# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=zig-bin0.14
pkgver=0.14.1
pkgrel=1
pkgdesc='A general-purpose programming language and toolchain for maintaining robust, optimal, and reusable software (pre-compiled binaries; version 0.14)'
arch=('x86_64')
url='https://ziglang.org/'
license=('MIT')
options=('!debug' '!strip')
source=("https://ziglang.org/download/${pkgver}/zig-${CARCH}-linux-${pkgver}.tar.xz")
sha256sums=('24aeeec8af16c381934a6cd7d95c807a8cb2cf7df9fa40d359aa884195c4716c')

package() {
    install -d -m755 "$pkgdir"/{opt/zig,usr/{bin,/share/licenses/"$pkgname"}}
    cp -dr --no-preserve='ownership' "zig-${CARCH}-linux-${pkgver}" "${pkgdir}/opt/zig/${pkgver}"
    ln -sr "${pkgdir}/opt/zig/${pkgver}/zig" "${pkgdir}/usr/bin/zig-0.14"
    ln -sr "${pkgdir}/opt/zig/${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
