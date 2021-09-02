# Maintainer: Bin Jin <bjin@ctrl-d.org>

pkgname=dprox
pkgver=0.3.0
pkgrel=1
pkgdesc="a lightweight DNS proxy server, compatible with dnsmasq-china-list"
url="https://github.com/bjin/dprox"
license=("BSD")
arch=('x86_64')
depends=()
optdepends=('dnsmasq-china-list-git: configuration file for easy deployment')
source=("https://hackage.haskell.org/packages/archive/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz")
source_x86_64=("https://github.com/bjin/dprox/releases/download/v${pkgver}/dprox-${pkgver}-linux-x86_64-static.tar.gz")
sha512sums=('2ab6598a79f72c5e9f9831e3a23f1b7abc014cf1f459a2687fb4ed3c42f0dcad158c7fc4d8938e2448533e4eacbc1db52e2745d78f902c1f88b069ad117d3e97')
sha512sums_x86_64=('f1242d83a4e74c69b20716cd136f75adf3a2b7d7ac9b0e572c512e4b571a1b4358d15fb0dba962854115d1d585e00956c90424083e437e57354b73cab06186d2')

package() {
    install -D -m755 "dprox" "${pkgdir}/usr/bin/dprox"

    cd $pkgname-$pkgver
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "systemd/dprox.service" "$pkgdir/usr/lib/systemd/system/dprox.service"
}
