# Maintainer: Bin Jin <bjin@ctrl-d.org>

pkgname=dprox
pkgver=0.2.0
pkgrel=1
pkgdesc="a lightweight DNS proxy server, compatible with dnsmasq-china-list"
url="https://github.com/bjin/dprox"
license=("BSD")
arch=('x86_64')
depends=()
optdepends=('dnsmasq-china-list-git: configuration file for easy deployment')
source=("https://hackage.haskell.org/packages/archive/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz")
source_x86_64=("https://github.com/bjin/dprox/releases/download/v${pkgver}/dprox-${pkgver}-linux-x86_64-static.tar.gz")
sha512sums=('3f48270de58145dbe477f5eaf15ba6b2dbd460665cc27da0da516ac46f757cc1f13f570c97ab936fd0b1d321df5908a433fea553f7ed1a6e8624894529d934e4')
sha512sums_x86_64=('16fbf2fde7e2d5be76327b9e3f8cc54565ddfdcae80c0780c2a921f8a0bfe76929f7b4b345dfebbe65cc853d0f292ffb0c73596960836248bd4e51a559cade5b')

package() {
    install -D -m755 "dprox" "${pkgdir}/usr/bin/dprox"

    cd $pkgname-$pkgver
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "systemd/dprox.service" "$pkgdir/usr/lib/systemd/system/dprox.service"
}
