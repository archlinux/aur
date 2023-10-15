# Maintainer: Hannes Hilbert <calendarsync at hsht dot de>

pkgname=calendarsync-bin
_pkgname=calendarsync
pkgver=0.8.0
pkgrel=1
pkgdesc='Stateless CLI tool to sync calendars across different calendaring systems'
arch=(x86_64 armv6 armv7 arm64)
url='https://github.com/inovex/CalendarSync'
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!lto')

source_x86_64=("$_pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/CalendarSync_${pkgver}_linux_amd64.tar.gz")
source_armv6=("$_pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/CalendarSync_${pkgver}_linux_armv6.tar.gz")
source_armv7=("$_pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/CalendarSync_${pkgver}_linux_armv7.tar.gz")
source_arm64=("$_pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/CalendarSync_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('8dad65f852781bdc4d41f826752c217d6f673d540dbd57bfc28d2dd9928d9124')
sha256sums_armv6=('ba7053dd7b8d1be0a4bcd01219cdc9ecc9bbc182f236f560eb87f6106ff7424f')
sha256sums_armv7=('81fcf8587fa38dcec0e8a53fd7710cca38c4df4a376bc38125e48485d46951dd')
sha256sums_arm64=('7e7e10b66d472f73ccd6bcdfecaf7113a3a4d03eccc704d3f677ecdcc01e9e77')

package() {
    cd "$srcdir/"
    install -Dm755 CalendarSync "$pkgdir/usr/bin/calendarsync"
}

check() {
    cd "$srcdir/"
    ./CalendarSync --version
}

