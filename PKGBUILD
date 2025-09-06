#!/bin/bash
# Maintainer: ThomasK1966 <admin at thomass-itwiki dot de>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=cockpit-navigator
pkgver=0.5.10
pkgrel=1
pkgrel=2
pkgdesc='A Featureful File Browser for Cockpit.'
url="https://github.com/45Drives/cockpit-navigator"
arch=('x86_64')
license=('GPL')
depends=('cockpit' 'python' 'rsync' 'zip')
source=("$url/archive/refs/tags/v$pkgver.tar.gz"
    "$url/releases/download/v$pkgver/LICENSE")
b2sums=('c29bf15b0698ef971345b2059236d094b9ed76f926c52f85ca4f06d1d451378e9d5d7edd2db835e864b8c3289ed508bd00815b83baa206a8d1196aaf0661587f'
        '74915e048cf8b5207abf603136e7d5fcf5b8ad512cce78a2ebe3c88fc3150155893bf9824e6ed6a86414bbe4511a6bd4a42e8ec643c63353dc8eea4a44a021cd')

package() {
    cd "$srcdir/$pkgname-$pkgver" || exit
    make DESTDIR="$pkgdir" NAV_VERS=$pkgver install
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
