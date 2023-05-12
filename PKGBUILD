# Maintainer: Bin Jin <bjin@ctrl-d.org>

pkgname=dprox
pkgver=0.4.0
pkgrel=2
pkgdesc="a lightweight DNS proxy server, compatible with dnsmasq-china-list"
url="https://github.com/bjin/dprox"
license=("BSD")
arch=('x86_64')
depends=()
optdepends=('dnsmasq-china-list-git: configuration file for easy deployment')
source=("https://github.com/bjin/dprox/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("https://github.com/bjin/dprox/releases/download/v${pkgver}/dprox-${pkgver}-linux-x86_64-static.tar.gz")
sha512sums=('6f935a2d89c6fb29d5f5647d08adadef182344d9417042c31838be6d5dbb381af5b5da91bbb98301bb94d81056115b0322e97a2f2fabca17edbdbd9faa0208b4')
sha512sums_x86_64=('9d5ab83daa9bc501667042f58a3e99ff216774565aca311150c89b02ef2ed1a9d86a9d30030470c086d4ed8cb71ed8c5f8fc965884ea22475cbc00e7c829f90d')

package() {
    install -D -m755 "dprox" "${pkgdir}/usr/bin/dprox"

    cd $pkgname-$pkgver
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "systemd/dprox.service" "$pkgdir/usr/lib/systemd/system/dprox.service"
}
