# Maintainer: Felix Laurie von Massenbach <felix@erbridge.co.uk>
pkgname=amulet
pkgver=1.0.9
pkgrel=1
pkgdesc="Lua-based audio / visual toolkit for small-scope games and experimentation"
arch=('x86_64')
url="http://www.amulet.xyz/"
license=('MIT')
depends=('gcc-libs-multilib')
source=("https://github.com/ianmaclarty/amulet/releases/download/v${pkgver}/amulet-v${pkgver}-linux.zip")
md5sums=('88f8045776df20c169ba4f2b72024f41')

package() {
    cd "amulet-v${pkgver}"

    install -d -m755 "${pkgdir}/usr/share/${pkgname}/builds"
    cp -r builds/* "${pkgdir}/usr/share/${pkgname}/builds"
    chmod -R 0644 "${pkgdir}/usr/share/${pkgname}/builds"

    rm -r "${pkgdir}/usr/share/${pkgname}/builds/"ios*

    install -D -m755 amulet "${pkgdir}/usr/share/${pkgname}/amulet"

    install -d -m755 "${pkgdir}/usr/bin"
    ln -s "${pkgdir}/usr/share/${pkgname}/amulet" "${pkgdir}/usr/bin/${pkgname}"

    install -D -m644 amulet_license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.pdf"
}
