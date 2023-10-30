# Maintainer: Hannes Hilbert <calendarsync at hsht dot de>

pkgname=calendarsync-bin
_pkgname=calendarsync
pkgver=0.8.1
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

sha256sums_x86_64=('342a02e6192e2154226b74d896ed7146995e1b35686a6d11b5f2ba58f2c1b286')
sha256sums_armv6=('d5c0fdd2b248675f3a8a6a23584cab8feae54ac9d0de19f3aee3172cc986ab79')
sha256sums_armv7=('076893b44e6c1a2c32cc508064da01e221f534ed6583b79bcb791ba2237a38c2')
sha256sums_arm64=('311a3c5399ae18007f8936217eb3f238a6aa0dceec37cb128ab65779b4d35d32')

package() {
    cd "$srcdir/"
    install -Dm755 CalendarSync "$pkgdir/usr/bin/calendarsync"
}

check() {
    cd "$srcdir/"
    ./CalendarSync --version
}
