# Maintainer: Hannes Hilbert <calendarsync at hsht dot de>

pkgname=calendarsync-bin
pkgver=0.7.0
pkgrel=1
pkgdesc='Stateless CLI tool to sync calendars across different calendaring systems'
arch=('x86_64')
url='https://github.com/inovex/CalendarSync'
license=('MIT')
provides=('calendarsync')
conflicts=('calendarsync')
options=('!lto')
source=("calendarsync-$pkgver.tar.gz::https://github.com/inovex/CalendarSync/releases/download/v$pkgver/CalendarSync_${pkgver}_linux_amd64.tar.gz")
sha256sums=('f2f82fa1ae13f1e66974af793a68d38f4230fb657e3d5c2b85e2e139d053794c')

package() {
    cd "$srcdir/"
    install -Dm755 CalendarSync "$pkgdir/usr/bin/calendarsync"
}

check() {
    cd "$srcdir/"
    ./CalendarSync --version
}

