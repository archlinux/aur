# Maintainer: Bin Jin <bjin@ctrl-d.org>

pkgname=dprox
pkgver=0.4.1
pkgrel=1
pkgdesc="a lightweight DNS proxy server, compatible with dnsmasq-china-list"
url="https://github.com/bjin/dprox"
license=("BSD")
arch=('x86_64')
depends=()
optdepends=('dnsmasq-china-list-git: configuration file for easy deployment')
source=("https://github.com/bjin/dprox/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("https://github.com/bjin/dprox/releases/download/v${pkgver}/dprox-${pkgver}-linux-x86_64-static.tar.gz")
sha512sums=('064a7bfd7337a9da552b894a2b3abdbcd6de958e96adcba0cf5a556fba2c1df8c262c055f5030698a8c7d3b7dbd5a22f4b4b1bbe0a368c7792baaf6a5ed00304')
sha512sums_x86_64=('78bdbd33f5b49230c5a48add1b8a0af5cccc05a17a462b2cf9fc0cb87706beed038248f6cc5f379430c0a0ef1bd9f3071dc2957ba60c5ce9377f8df93dec8a04')

package() {
    install -D -m755 "dprox" "${pkgdir}/usr/bin/dprox"

    cd $pkgname-$pkgver
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "systemd/dprox.service" "$pkgdir/usr/lib/systemd/system/dprox.service"
}
