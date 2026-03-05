# Maintainer: xTom <packages@xtom.com>
# Maintainer: Xiufeng Guo <i@m.ac>
pkgname=rdap-bin
pkgver=1.0.4
pkgrel=1
pkgdesc="A modern RDAP (Registration Data Access Protocol) client - prebuilt binary"
arch=('x86_64' 'aarch64')
url="https://github.com/xtomcom/rdap"
license=('MIT')
depends=('gcc-libs')
provides=('rdap')
conflicts=('rdap')
options=('!strip' '!debug')
source_x86_64=("$pkgname-$pkgver-x86_64.deb::$url/releases/download/v$pkgver/rdap_${pkgver}_amd64.deb")
source_aarch64=("$pkgname-$pkgver-aarch64.deb::$url/releases/download/v$pkgver/rdap_${pkgver}_arm64.deb")
sha256sums_x86_64=('d3a1a22504c81d0619775ff090689ffd71093bc86e0117dc821bac0e06665426')
sha256sums_aarch64=('ef059d5a9df96df81c73100ebe88477041867845bca3e492a8f85859301a72a4')

package() {
    cd "$srcdir"

    # Extract deb package
    bsdtar -xf data.tar.*

    # Install files
    install -Dm755 "usr/bin/rdap" "$pkgdir/usr/bin/rdap"
}
