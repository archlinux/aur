# Maintainer: Bin Jin <bjin@ctrl-d.org>

pkgname=dprox
pkgver=0.4.3
pkgrel=1
pkgdesc="a lightweight DNS proxy server, compatible with dnsmasq-china-list"
url="https://github.com/bjin/dprox"
license=("BSD")
arch=('x86_64')
depends=()
optdepends=('dnsmasq-china-list-git: configuration file for easy deployment')
source=("https://github.com/bjin/dprox/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("https://github.com/bjin/dprox/releases/download/v${pkgver}/dprox-${pkgver}-linux-x86_64-static.tar.gz")
sha512sums=('5f4a227d3bca10c480214b8f854588d291c08747a097faf6d442166d7d88434b4ccd35641fff67413071c65073fe29462ebd3c25ca5efc9f04d00273bd17a869')
sha512sums_x86_64=('36ad08231b68b2cd7f5986bdbbfb7ca0eb08f32f5c28f8a6be43f7dd87c29fc4efb58a1b577f2a1505f9c7ba9af3ac609a43ffb86f1e6b05017a15818f4e029e') 

package() {
    install -D -m755 "dprox" "${pkgdir}/usr/bin/dprox"

    cd $pkgname-$pkgver
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "systemd/dprox.service" "$pkgdir/usr/lib/systemd/system/dprox.service"
}
