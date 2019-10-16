# Maintainer: Bin Jin <bjin@ctrl-d.org>

pkgname=dprox
pkgver=0.1.2.1
pkgrel=2
pkgdesc="a lightweight DNS proxy server, compatible with dnsmasq-china-list"
url="https://github.com/bjin/dprox"
license=("BSD")
arch=('x86_64' 'aarch64')
depends=()
optdepends=('dnsmasq-china-list-git: configuration file for easy deployment')
source=("https://hackage.haskell.org/packages/archive/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz")
source_aarch64=("https://github.com/bjin/dprox/releases/download/v${pkgver}/dprox-${pkgver}-linux-aarch64-static.tar.gz")
source_x86_64=("https://github.com/bjin/dprox/releases/download/v${pkgver}/dprox-${pkgver}-linux-x86_64-static.tar.gz")
sha512sums=('24bacb9ab594f571fc07c715f53fa1130bc5206fcf2a7d7ab00cbfa7c3f1f43f87a9131d75b5c02b18c13a7afd7cea2a5ec0d3346c811cfaeceedd1130725ecb')
sha512sums_aarch64=('b2df8de2162cd776bdc84bf98c89b5de8048b8aae869aaf4aaad01d31e7db7a6ad52df627d5e88b8be488270f8e5876077c4b80bd6cab9342641d62672690b62')
sha512sums_x86_64=('00280d7e6b9e38939f916291569a3949915b9b8d75d2d4e0c464479260b49c1423dc54d84c810d12978f91174e1a79035b382ccc7720441e49b5b94be0ffcafd')

package() {
    install -D -m755 "dprox" "${pkgdir}/usr/bin/dprox"

    cd $pkgname-$pkgver
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "systemd/dprox.service" "$pkgdir/usr/lib/systemd/system/dprox.service"
}
