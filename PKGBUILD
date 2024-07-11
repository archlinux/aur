# Maintainer: Hannes Hilbert <calendarsync at hsht dot de>

pkgname=calendarsync-bin
_pkgname=calendarsync
pkgver=0.10.0
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

sha256sums_x86_64=('147a8e5427a46c494f6b285319b5b62aafebcde20996421d53ec0ae14be9c698')
sha256sums_armv6=('dfba40c82087c6ceffbb6a0816f766850cc351e2d5968c951eb33fcc5be91f86')
sha256sums_armv7=('4280964506c9171dd4e8010c7220c952ec69b5e9ca483956dd430625a27ad869')
sha256sums_arm64=('d2f0b152b3c26ae9876482e89ed1b813b87216e59f745c37b2d4b98638fdf32f')

package() {
    cd "$srcdir/"
    install -Dm755 CalendarSync "$pkgdir/usr/bin/calendarsync"
}

check() {
    cd "$srcdir/"
    ./CalendarSync --version
}
