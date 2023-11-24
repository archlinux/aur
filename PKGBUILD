# Maintainer: Hannes Hilbert <calendarsync at hsht dot de>

pkgname=calendarsync-bin
_pkgname=calendarsync
pkgver=0.9.0
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

sha256sums_x86_64=('813659d87f6734bca3632da2a8b0d9fa5c132192dbcc89b9cc1ded86eae4d9e3')
sha256sums_armv6=('056b03606e7dadae390b10f1e692d2954951eba1a32a34b3f008238aebb378ea')
sha256sums_armv7=('589cca90b31eea5f8f47f16582ed8cd9a89d0cdaea0e19efeda761c45c9e346e')
sha256sums_arm64=('aa97553ef0acea06f8839302c398d85ed5cc8e41abe509be5cba06ff8a866aca')

package() {
    cd "$srcdir/"
    install -Dm755 CalendarSync "$pkgdir/usr/bin/calendarsync"
}

check() {
    cd "$srcdir/"
    ./CalendarSync --version
}
