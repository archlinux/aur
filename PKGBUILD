#!/bin/bash
# Maintainer: ThomasK1966 <admin at thomass-itwiki dot de>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=cockpit-navigator
pkgver=0.6.0
pkgrel=1
pkgdesc='A Featureful File Browser for Cockpit.'
url="https://github.com/45Drives/cockpit-navigator"
arch=('any')
license=('GPL-3.0')
depends=('cockpit' 'python' 'rsync' 'zip')
source=("cockpit-navigator-${pkgver}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
    
b2sums=('52a0e2e6c0925b831669cc03e0b4e295795afb2ddbe242c6c30223890f2222800793aacec273a93dd526b45a08dec27275f8798554f1c8ef88c99ba2c8b7bf7c')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" NAV_VERS=$pkgver install
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
