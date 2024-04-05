# Maintainer: Hannes Hilbert <calendarsync at hsht dot de>

pkgname=calendarsync-bin
_pkgname=calendarsync
pkgver=0.9.3
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

sha256sums_x86_64=('f1ee7c7c45f55cc04c3ffcdbef10f25ad1792498e04e23bfb4f10a56030154a0')
sha256sums_armv6=('7070cfbb5194ce04c4154801c5c06161ea1dce20b3951589d18054175273ad6d')
sha256sums_armv7=('9a874524c6a31fc0bc017c1aa29b1fc1deb941b182ffe684aeeb348c8f45401c')
sha256sums_arm64=('7d1bfd1eef0c76cabfc6e1c96b3b5e14cf901b188471427fd94339df769b7c6e')

package() {
    cd "$srcdir/"
    install -Dm755 CalendarSync "$pkgdir/usr/bin/calendarsync"
}

check() {
    cd "$srcdir/"
    ./CalendarSync --version
}
