#!/bin/bash
# Maintainer: ThomasK1966 <admin at thomass-itwiki dot de>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=cockpit-navigator
pkgver=0.5.12
pkgrel=2
pkgdesc='A Featureful File Browser for Cockpit.'
url="https://github.com/45Drives/cockpit-navigator"
arch=('any')
license=('GPL-3.0')
depends=('cockpit' 'python' 'rsync' 'zip')
source=("cockpit-navigator-${pkgver}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
    
b2sums=('b1a121410b6f62236c030e5ee90fc627f7f6b3de0b0a3bf7e53b2c7ba91d4e1e261c620944e6ec6dafb129c02903f35a5f297f6774ebc57d25646f9745aa53ee')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" NAV_VERS=$pkgver install
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
