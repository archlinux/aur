# Maintainer: xTom <packages@xtom.com>
# Maintainer: Xiufeng Guo <i@m.ac>
pkgname=rdap-bin
pkgver=1.0.1
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
sha256sums_x86_64=('21a5e3af79082e1c411288987cfc4ba3e29aa726be6c7e0e25d52e6cd33b2928')
sha256sums_aarch64=('9cde503e116c71ada3f52a3a81d70c36c0d8d250cbdb9d6d1b6706586bba1388')

package() {
    cd "$srcdir"

    # Extract deb package
    bsdtar -xf data.tar.*

    # Install files
    install -Dm755 "usr/bin/rdap" "$pkgdir/usr/bin/rdap"
}
