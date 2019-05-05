# Maintainer: Marco Scarpetta <marcoscarpetta02@gmail.com>

pkgname=drivesync
pkgver=1.4.0
pkgrel=1
pkgdesc='Google Drive synchronization for Linux'
arch=('any')
url='https://github.com/MStadlmeier/drivesync'
license=('MIT')
depends=('ruby2.5')
makedepends=('ruby2.5-bundler')
source=("https://github.com/MStadlmeier/$pkgname/archive/$pkgver.tar.gz"
        'drivesync')
sha512sums=('9f08348ffeaf783832b817cda3616d9206492474767a2ffc772d6d7405af926c64f2e20c7e332d39d35156afa09d6388371469ba8c62b57642a92775a5de9a16'
            'e04598797da983c07a862a9a0f7e6545e41f5a0f61673aa1b327dd1dfd7e1166a2d76b0d3548e84e2935e1a9457f9e9600351ccfbcf68dcceb10dea3206094c3')

build() {
    cd "$pkgname-$pkgver"
    bundle-2.5 install --no-cache --deployment
}

package() {
    install -D -m755 'drivesync' "$pkgdir/usr/bin/drivesync"
    install -d -m755 "$pkgdir/usr/share/drivesync"
    
    cd "$pkgname-$pkgver"
    cp -r * "$pkgdir/usr/share/drivesync/"
}
