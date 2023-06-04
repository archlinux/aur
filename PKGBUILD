# Maintainer: Bin Jin <bjin@ctrl-d.org>

pkgname=dprox
pkgver=0.4.2
pkgrel=1
pkgdesc="a lightweight DNS proxy server, compatible with dnsmasq-china-list"
url="https://github.com/bjin/dprox"
license=("BSD")
arch=('x86_64')
depends=()
optdepends=('dnsmasq-china-list-git: configuration file for easy deployment')
source=("https://github.com/bjin/dprox/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("https://github.com/bjin/dprox/releases/download/v${pkgver}/dprox-${pkgver}-linux-x86_64-static.tar.gz")
sha512sums=('cc18bfaf4063bcb1e0f227872144253a7d1b3b5a339eb76acd8be6b873bdeca91e5c005901598f4db0481ec1ce54848de5fd2b93802ccec42c04fc9163840af0')
sha512sums_x86_64=('76ac5d2a9176708aff8cbb0ed697ec22e48bd66ee3ec3c4c11648b537f6854ced86157f57ed8abc2c7c3ac893f78baef251612e16ea513a2da47b024c30c82a2')

package() {
    install -D -m755 "dprox" "${pkgdir}/usr/bin/dprox"

    cd $pkgname-$pkgver
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "systemd/dprox.service" "$pkgdir/usr/lib/systemd/system/dprox.service"
}
